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
- (void)loadSampleData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data"
                                                     ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    [self loadWithData:data];
}
- (void)loadFromServer {
    NSURL *serverURL = [NSURL URLWithString:@"http://git-gour-api.herokuapp.com/echi-gour.json"];
    NSData *data = [NSData dataWithContentsOfURL:serverURL];
    [self loadWithData:data];
}
- (void)loadWithData:(NSData *)data {
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

- (NSArray *)sortedChukaItems {
    return [self sortItems:[self chukaItems]];
}
- (NSArray *)sortedOrosiItems {
    return [self sortItems:[self orosiItems]];
}
- (NSArray *)sortedVolgaItems {
    return [self sortItems:[self volgaItems]];
}
- (NSArray *)sortItems:(NSArray *)unsorted {
    NSMutableArray *mutArr = [NSMutableArray arrayWithArray:unsorted];
    return [mutArr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        Place *place1 = (Place *)obj1;
        Place *place2 = (Place *)obj2;
        if (place1.umaPoint < place2.umaPoint) {
            return NSOrderedAscending;
        } else if (place1.umaPoint > place2.umaPoint) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
}
- (NSInteger)totalUmaForChuka {
    return [self totalUmaWithItems:[self chukaItems]];
}

- (NSInteger)totalUmaForVolga {
    return [self totalUmaWithItems:[self volgaItems]];
}

- (NSInteger)totalUmaForOrosi {
    return [self totalUmaWithItems:[self orosiItems]];
}

- (NSInteger)totalUmaWithItems:(NSArray *)items {
    NSInteger total = 0;
    for (Place *item in items) {
        total += item.umaPoint;
    }
    return total;
}

@end
