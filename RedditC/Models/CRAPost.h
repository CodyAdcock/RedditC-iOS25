//
//  Post.h
//  RedditC
//
//  Created by Cody on 3/27/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRAPost : NSObject

//Properties
@property (nonatomic, copy, readonly) NSString * title;
@property (nonatomic, readonly) NSNumber * ups;
@property (nonatomic, readonly) NSNumber * commentCount;

//memberwise init
-(instancetype)initWithTitle:(NSString *)title commentCount:(NSNumber *)commentCount ups:(NSNumber *) ups;

//initWithDict
-(instancetype)initWithDict:(NSDictionary *)dictionary;
//🦀🦀🦀 We can init with DICTIONARY! 🦀🦀🦀

@end

NS_ASSUME_NONNULL_END
