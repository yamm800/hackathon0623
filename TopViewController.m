//
//  TopViewController.m
//  Hackathon20130622
//
//  Created by 山口 智行 on 13/06/23.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import "TopViewController.h"
#import "SpotListViewController.h"
#import "OvalGraphView.h"

@interface TopViewController ()

@end

@implementation TopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //勢力を調べます
    NSLog(@"%d",[self.placeManager totalUmaForChuka]);
    NSLog(@"%d",[self.placeManager totalUmaForVolga]);
    NSLog(@"%d",[self.placeManager totalUmaForOrosi]);
    
    OvalGraphView *oGraph =
    [[OvalGraphView alloc] initWithFrame:
     CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    [self.view addSubview:oGraph];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIButton *button = sender;
    SpotListViewController *spotVC = [segue destinationViewController];
    spotVC.type = button.tag;
}

@end
