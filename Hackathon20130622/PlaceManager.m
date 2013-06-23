//
//  PlaceManager.m
//  Hackathon20130622
//
//  Created by pom on 13/06/23.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import "Place.h"
#import "PlaceManager.h"
@interface PlaceManager()
@property (nonatomic, strong) NSArray *items;
@end
@implementation PlaceManager
+ (PlaceManager *)sharedManager {
    static dispatch_once_t once;
    static PlaceManager *manager;
    
    dispatch_once(&once, ^ {
        manager = [[PlaceManager alloc] init];
    });
    return manager;
}

- (NSArray *)chukaItems {
    return [self itemsWithCategory:0];
}
- (NSArray *)volgaItems {
    return [self itemsWithCategory:1];
}
- (NSArray *)orosiItems {
    return [self itemsWithCategory:2];
}

- (NSArray *)itemsWithCategory:(NSInteger)category {
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (Place *item in self.items) {
        if (item.category == category) {
            [tmpArray addObject:item];
        }
    }
    return [NSArray arrayWithArray:tmpArray];
}

- (void)loadSampleData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data"
                                                     ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data
                                                    options:0
                                                      error:&error];
    if (!error) {
        NSMutableArray *tmpItems = [NSMutableArray array];
        for (NSDictionary *dict in json) {
            Place *place = [[Place alloc] initWithDictionary:dict];
            [tmpItems addObject:place];
        }
        self.items = [NSArray arrayWithArray:tmpItems];
    } else {
        NSLog(@"error = %@", error);
    }
}
@end
