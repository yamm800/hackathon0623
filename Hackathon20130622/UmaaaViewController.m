//
//  UmaaaViewController.m
//  Hackathon20130622
//
//  Created by 山口 智行 on 13/06/23.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import "UmaaaViewController.h"
#import <QuartzCore/QuartzCore.h>

#define UMAAA_AA    @"%d(ﾟдﾟ*)ｳﾏｰ"

@interface UmaaaViewController (){
    CAEmitterLayer *emitterLayer;
}

@end

@implementation UmaaaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"didload");
    
    _umaaa_point = 0;
    
    //パーティクル表示
    emitterLayer = [CAEmitterLayer layer];
    CGSize size = self.view.bounds.size;
    emitterLayer.emitterPosition = CGPointMake(size.width / 2, size.height / 2);
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    [self.view.layer addSublayer:emitterLayer];
    
    //ウマーボタンの見た目をカスタム
    _umaaaButton.layer.borderColor = [UIColor redColor].CGColor;
    _umaaaButton.layer.borderWidth = 3;
    _umaaaButton.layer.cornerRadius = _umaaaButton.bounds.size.width/2;
    
    
    [_umaaaButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_umaaaButton setTitle:[NSString stringWithFormat:UMAAA_AA,_umaaa_point]
                  forState:UIControlStateNormal];
    [_umaaaButton setTitle:@" (*´～｀*)ŧ‹\"ŧ‹\""
                  forState:UIControlStateHighlighted];
    [_umaaaButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)umaaaAction:(id)sender {
    NSLog(@"umaaa");
    if(_umaaa_point < 10){
        _umaaa_point++;
    }
    
    
    if(_umaaa_point >= 10){
        
        CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
        UIImage *image = [UIImage imageNamed:@"particle1"];
        emitterCell.contents = (__bridge id)(image.CGImage);
        emitterCell.emissionLongitude = M_PI * 2;
        emitterCell.emissionRange = M_PI * 2;
        //emitterCell.lifetimeRange = 1.2;
        emitterCell.velocity = 240;
        emitterCell.birthRate = 8000;
        emitterCell.scale = 0.5;
        emitterCell.velocity = 130;
        emitterCell.lifetime = 3.0;
        emitterCell.yAcceleration = 80;
//        emitterCell.beginTime = 1;
        emitterCell.duration = 0.1;
//        emitterCell.alphaSpeed = -0.1;
//        emitterCell.scaleSpeed = -0.1;
        emitterCell.color = [UIColor colorWithRed:0.89
                                            green:0.56
                                             blue:0.36
                                            alpha:0.5].CGColor;

//        emitterCell.color = [UIColor colorWithRed:0.89
//                                            green:0.56
//                                             blue:0.36
//                                            alpha:0.5].CGColor;
        
        emitterLayer.emitterCells = @[emitterCell];
        
        [_umaaaButton setTitle:@"・゜ﾊﾟｧｧｧ(´∀｀*)ﾟ・*"
                      forState:UIControlStateNormal];
        return;
    }
    
    [_umaaaButton setTitle:[NSString stringWithFormat:UMAAA_AA,_umaaa_point]
                  forState:UIControlStateNormal];
}
@end
