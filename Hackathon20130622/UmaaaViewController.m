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
#define TYPE_VOLGA @"volga_%d"
#define TYPE_OROSHI @"oroshi_%d"
#define TYPE_TYUKA  @"tyuka_%d"

@interface UmaaaViewController (){
    NSInteger type;
}

@end

@implementation UmaaaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"didload");
    
    _umaaa_point = 0;
    
    _umaaaLabel.text = [NSString stringWithFormat:@"%dウマー",_umaaa_point];
    
    [_umaaaButton setImage:[UIImage imageNamed:@"yellow_umaaa"]
                  forState:UIControlStateNormal];
    [_umaaaButton setImage:[UIImage imageNamed:@"yellow_mogu"]
                  forState:UIControlStateHighlighted];
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
    
    _umaaaLabel.text = [NSString stringWithFormat:@"%dウマー",_umaaa_point];
    
    if(_umaaa_point >= 10){
        
        [self actionParticle];
        
        [_umaaaButton setImage:[UIImage imageNamed:@"yellow_paaa"]
                      forState:UIControlStateNormal];
        return;
    }
    
    NSLog(@"%d_uma",_umaaa_point);
    
    [_umaaaButton setTitle:[NSString stringWithFormat:UMAAA_AA,_umaaa_point]
                  forState:UIControlStateNormal];
}

-(void)actionParticle{
    
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    //表示する場所。
    emitterLayer.emitterPosition = CGPointMake(screenRect.size.width/2.0f, screenRect.size.height/2.0f);
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < 3; i++) {
        CAEmitterCell *cell = [CAEmitterCell emitterCell];
        //各種パラメータ。この手のものはいじってみるのが一番わかりやすいです。
        cell.birthRate = 30;
        cell.lifetime = 0.5f;
        cell.lifetimeRange = 0.5f;
        NSString *imageName = @"particle1";
        cell.contents =(id)[UIImage imageNamed:imageName].CGImage;
        cell.velocity = 300.0f;
        cell.velocityRange = 200.0f;
        cell.scale = 0.1f;
        cell.scaleRange = 1.0f;
        cell.spin = 0.1f;
        cell.spinRange = 4.0f;
        cell.yAcceleration = -50;
        cell.emissionRange = M_PI*2;
        [array addObject:cell];
    }
    
    emitterLayer.emitterCells = array;
    
    //layerにaddSublayerすれば、表示されます。
    [self.view.layer addSublayer:emitterLayer];
    
    //3秒後に停止。停止でなくて、アニメーション加えたりも可能なんで、あれこれできます
    [self performSelector:@selector(stopEmitter:) withObject:emitterLayer afterDelay:0.3f];
}

//停止用メソッド。停止でなくても途中でパラメータ変更できます。
-(void)stopEmitter:(CAEmitterLayer*)emitterLayer{
    //このbirthRateは、各cellに対するmultiplier
    emitterLayer.birthRate = 0.0f;
}

@end
