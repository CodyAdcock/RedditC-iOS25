//
//  CRASubredditClient.h
//  RedditC
//
//  Created by Cody on 3/27/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRAPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRASubredditClient : NSObject

+(void)fetchAllSubRedditsForTitle:(NSString *)title completion:(void(^)(NSArray<CRAPost *> *posts))completion;

@end

NS_ASSUME_NONNULL_END
