//
//  ProgressView.m
//  43-绘图
//
//  Created by shadandan on 16/7/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ProgressView.h"
@interface ProgressView()
@end
@implementation ProgressView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0-0.5*M_PI endAngle:self.value*2*M_PI-0.5*M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(150,150)];
    [[UIColor redColor] setFill];
    [path fill];
}
//重写set方法，一调用就重绘
-(void)setValue:(CGFloat)value{
    _value=value;
    [self setNeedsDisplay];//重绘
}

@end
