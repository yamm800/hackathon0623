//
//  UmaaaViewController.h
//  Hackathon20130622
//
//  Created by 山口 智行 on 13/06/23.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UmaaaViewController : UIViewController

@property (nonatomic)                   NSInteger   umaaa_point;
@property (weak, nonatomic) IBOutlet    UIButton    *umaaaButton;

- (IBAction)umaaaAction:(id)sender;

@end
