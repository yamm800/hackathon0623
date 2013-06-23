//
//  PlaceManager.h
//  Hackathon20130622
//
//  Created by pom on 13/06/23.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlaceManager : NSObject

+ (PlaceManager *)sharedManager;
- (void)loadSampleData;
- (NSArray *)chukaItems;
- (NSArray *)volgaItems;
- (NSArray *)orosiItems;
- (NSInteger)totalUmaForChuka;
- (NSInteger)totalUmaForVolga;
- (NSInteger)totalUmaForOrosi;
@end
