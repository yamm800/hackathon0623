//
//  UmaaaViewController.m
//  Hackathon20130622
//
//  Created by 山口 智行 on 13/06/23.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import "UmaaaViewController.h"

#define UMAAA_AA    @"%d(ﾟдﾟ*)ｳﾏｰ"

@interface UmaaaViewController (){
    
}

@end

@implementation UmaaaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"didload");
    
    _umaaa_point = 0;
    [_umaaaButton setTitle:[NSString stringWithFormat:UMAAA_AA,_umaaa_point]
                  forState:UIControlStateNormal];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)umaaaAction:(id)sender {
    NSLog(@"umaaa");
    _umaaa_point++;
    [_umaaaButton setTitle:[NSString stringWithFormat:UMAAA_AA,_umaaa_point]
                  forState:UIControlStateNormal];
}
@end
