//
//  Place.m
//  Hackathon20130622
//
//  Created by pom on 13/06/23.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import "Place.h"
@interface Place()

@property (nonatomic, readwrite, copy) NSString *name;
@property (nonatomic, readwrite) NSInteger category;
@property (nonatomic, readwrite, copy) NSString *guide;
@property (nonatomic, readwrite, copy) NSString *phone;
@property (nonatomic, readwrite, copy) NSString *open;
@property (nonatomic, readwrite, copy) NSString *latitude;
@property (nonatomic, readwrite, copy) NSString *longtitude;
@property (nonatomic, readwrite, copy) NSString *access;
@property (nonatomic, readwrite, copy) NSString *price;
@property (nonatomic, readwrite, copy) NSString *holiday;
@property (nonatomic, readwrite, copy) NSString *zipcode;
@property (nonatomic, readwrite, copy) NSString *address;

@end
@implementation Place

- (id)initWithDictionary:(NSDictionary *)aDict {
    self = [super init];
    if (self) {
        self.name = [aDict objectForKey:@"name"];
        NSNumber *categoryNumber = [aDict objectForKey:@"category"];
        self.category = [categoryNumber integerValue];
        self.guide = [aDict objectForKey:@"guide"];
        self.phone = [aDict objectForKey:@"phone"];
        self.open = [aDict objectForKey:@"open"];
        self.latitude = [aDict objectForKey:@"latitude"];
        self.longtitude = [aDict objectForKey:@"longtitude"];
        self.access = [aDict objectForKey:@"access"];
        self.price = [aDict objectForKey:@"price"];
        self.holiday = [aDict objectForKey:@"holiday"];
        self.zipcode = [aDict objectForKey:@"zipcode"];
        self.address = [aDict objectForKey:@"address"];
    }
    return self;
}
@end
