//
//  ViewController.m
//  Hackathon20130622
//
//  Created by 山口 智行 on 13/06/22.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import "ViewController.h"
#import "MyXMLParser.h"
#import "Place.h"
#import "PlaceManager.h"
@interface ViewController (){
    MyXMLParser *_parser;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    _parser = [[MyXMLParser alloc] init];
//    
//    [_parser loadingXML:@"http://miseban.com/od/miseban.xml"];
    
    PlaceManager *manager = [PlaceManager sharedManager];
    [manager loadSampleData];
    for (Place *item in [manager chukaItems]) {
        item.umaPoint += 10;
    }
    NSInteger chuka = [manager totalUmaForChuka];
    NSLog(@"point = %d", chuka);
    NSLog(@"chukas = %@", [manager chukaItems]);
    NSLog(@"orosis = %@", [manager orosiItems]);
    NSLog(@"volgas = %@", [manager volgaItems]);
    
}


@end
