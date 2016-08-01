//
//  CutView.m
//  43-绘图
//
//  Created by shadandan on 16/8/1.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "CutView.h"

@implementation CutView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // 获取上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    //在上下文上画一个裁剪的显示区域
    //CGContextAddArc(ctx, 150, 150, 150, 0, 2*M_PI, 1);//裁剪出圆形
    
    CGContextAddRect(ctx, CGRectMake(0, 0, 150, 150));//裁剪出左上角
    CGContextAddRect(ctx, CGRectMake(150, 150, 150, 150));//裁剪出右上角
    
    //CGContextFillPath(ctx);//哪块变黑哪块就是裁剪出来显示的区域
    
    //裁剪上下文显示的区域
    CGContextClip(ctx);
    
    UIImage *image=[UIImage imageNamed:@"h_main_AdgY_1f85000000c6111a"];
    
    //绘制到view上
    [image drawInRect:rect];
}


@end
