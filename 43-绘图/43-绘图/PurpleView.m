//
//  PurpleView.m
//  43-绘图
//
//  Created by shadandan on 16/7/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "PurpleView.h"

@implementation PurpleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:2*M_PI clockwise:YES];
    UIBezierPath *path1=[UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:50 startAngle:0 endAngle:2*M_PI clockwise:NO];
    CGContextAddPath(ctx, path.CGPath);
    CGContextAddPath(ctx, path1.CGPath);
    //默认填充模式：非零环绕数规则，在区域内选一点向外做射线，与边界有若干个交点，从圆心向外引一条射线，按照设定的方向旋转，该射线从左到右跨过交点则+1，从右到左跨过交点则-1，若几个交点的最后和为0，则不填充，不为0则填充
    CGContextDrawPath(ctx, kCGPathEOFill);
}


@end
