//
//  GrayView.m
//  43-绘图
//
//  Created by shadandan on 16/7/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "GrayView.h"

@implementation GrayView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    UIBezierPath *path=[UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 100)];
    UIBezierPath *path1=[UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 150) radius:80 startAngle:0 endAngle:2*M_PI clockwise:YES];
    UIBezierPath *path2=[UIBezierPath bezierPathWithRect:CGRectMake(250, 30, 20, 200)];
    CGContextAddPath(ctx, path.CGPath);
    CGContextAddPath(ctx, path1.CGPath);
    CGContextAddPath(ctx, path2.CGPath);
    //奇偶填充规则(不是默认的填充规则):被覆盖过奇数次的点填充，被覆盖过偶数次的点不填充
    CGContextDrawPath(ctx, kCGPathEOFill);
}


@end
