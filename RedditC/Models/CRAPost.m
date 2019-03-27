//
//  Post.m
//  RedditC
//
//  Created by Cody on 3/27/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRAPost.h"

@implementation CRAPost

-(instancetype)initWithTitle:(NSString *)title commentCount:(NSNumber *)commentCount ups:(NSNumber *)ups
{
    self = [super init];
    if(self){
        _title = [title copy];
        _commentCount = commentCount;
        _ups = ups;
    }
    return self;
}

-(instancetype)initWithDict:(NSDictionary *)dictionary
{
    NSDictionary *dataDictionary = dictionary[@"data"];
    NSString *title = dataDictionary[[CRAPost titleKey]];
    NSNumber *commentCount = dataDictionary[[CRAPost commentCountKey]];
    NSNumber *ups = dataDictionary[[CRAPost upsKey]];
    
    return [self initWithTitle:title commentCount:commentCount ups:ups];
}

+(NSString *)titleKey
{
    return @"title";
}

+(NSString *)commentCountKey
{
    return @"num_comments";
}

+(NSString *)upsKey
{
    return @"ups";
}

@end
