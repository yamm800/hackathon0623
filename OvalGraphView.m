//
//  OvalGraphView.m
//  Hackathon20130622
//
//  Created by 山口 智行 on 13/06/23.
//  Copyright (c) 2013年 Tomotaka Yamaguchi. All rights reserved.
//

#import "OvalGraphView.h"

@implementation OvalGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    CGContextRef ctx = UIGraphicsGetCurrentContext();  // コンテキストを取得
    
    //透明で塗りつぶし
    CGRect r1 = self.frame;
    CGContextSetRGBFillColor(ctx, 1.0, 1.0, 1.0, 1.0);
    CGContextAddRect(ctx, r1);
    CGContextFillPath(ctx);
    
    CGContextSetRGBFillColor(ctx, 1.0, 0.5, 0.0, 1.0);
    CGContextSetRGBStrokeColor(ctx, 1.0, 0.0, 0.5, 1.0);

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, self.center.x, self.center.y, self.bounds.size.width/2, 0, M_PI, NO);
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);
    CGPathRelease(path);
    
    
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    CGContextSetLineWidth(context, 10.0);
//    CGRect r1 = CGRectMake(50.0, 50.0, 100.0, 100.0);
//    CGContextAddRect(context, r1);
//    CGContextFillPath(context);
//    CGRect r2 = CGRectMake(100.0, 100.0, 100.0, 100.0);
//    CGContextAddRect(context, r2);
//    CGContextStrokePath(context);
    
}


@end
