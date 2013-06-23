//
//  LoadDataViewController.m
//  Hackathon20130622
//
//  Created by 山口 智行 on 13/06/23.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import "LoadDataViewController.h"


@interface LoadDataViewController (){
   
}

@end

@implementation LoadDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _placeManager = [PlaceManager sharedManager];
        [_placeManager loadSampleData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _placeManager = [PlaceManager sharedManager];
    [_placeManager loadFromServer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
