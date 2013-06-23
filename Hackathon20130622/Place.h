//
//  Place.h
//  Hackathon20130622
//
//  Created by pom on 13/06/23.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) NSInteger category;
@property (nonatomic, readonly, copy) NSString *guide;
@property (nonatomic, readonly, copy) NSString *phone;
@property (nonatomic, readonly, copy) NSString *open;
@property (nonatomic, readonly, copy) NSString *latitude;
@property (nonatomic, readonly, copy) NSString *longtitude;
@property (nonatomic, readonly, copy) NSString *access;
@property (nonatomic, readonly, copy) NSString *price;
@property (nonatomic, readonly, copy) NSString *holiday;
@property (nonatomic, readonly, copy) NSString *zipcode;
@property (nonatomic, readonly, copy) NSString *address;

@property (nonatomic) NSInteger umaPoint;

- (id)initWithDictionary:(NSDictionary *)aDict;
@end
