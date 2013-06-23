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
- (void)loadFromServer;
- (NSArray *)chukaItems;
- (NSArray *)sortedChukaItems;
- (NSArray *)volgaItems;
- (NSArray *)sortedVolgaItems;
- (NSArray *)orosiItems;
- (NSArray *)sortedOrosiItems;
- (NSInteger)totalUmaForChuka;
- (NSInteger)totalUmaForVolga;
- (NSInteger)totalUmaForOrosi;
@end
