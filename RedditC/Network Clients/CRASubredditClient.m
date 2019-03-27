//
//  CRASubredditClient.m
//  RedditC
//
//  Created by Cody on 3/27/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRASubredditClient.h"

@implementation CRASubredditClient

+(NSURL *)baseURL{
    return [NSURL URLWithString:@"https://www.reddit.com/r/"];
}


+(void)fetchAllSubRedditsForTitle:(NSString *)title completion:(void(^)(NSArray<CRAPost *> *posts))completion
{
    NSURL *url = [[[CRASubredditClient baseURL] URLByAppendingPathComponent:title] URLByAppendingPathExtension:@"json"];
    NSLog(@"🦀🦀🦀 URL HERE! %@ LEVEL TREE! 🦀🦀🦀", [url absoluteString]);
    //🦀🦀🦀 We created a URL 🦀🦀🦀
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //handle the error
        if(error){
            NSLog(@"🦀🦀🦀 THERE WAS AN ERROR 🦀🦀🦀 %@ %@ 🦀🦀🦀", error, error.localizedDescription);
            completion(nil);
            return;
        }
        NSLog(@"%@", response);
        //double check that we got data
        if(!data){
            NSLog(@"🦀🦀🦀 DATA TOOK THE KIDS! NO DATA AVAILABLE! 🦀🦀🦀");
            completion(nil);
            return;
        }
        //Serialize data to JSON
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *dataDictionary = jsonDictionary[@"data"];
        NSArray *childrenArray = dataDictionary[@"children"];
        
        //Make our array
        NSMutableArray *postsArray = [[NSMutableArray alloc]init];
        
        for (NSDictionary *postDictionary in childrenArray){
            CRAPost *post = [[CRAPost alloc] initWithDict:postDictionary];
            [postsArray addObject:post];
        }
        //complete
        completion(postsArray);
    }]resume];
    
}

@end
