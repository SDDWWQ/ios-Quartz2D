//
//  YellowView.m
//  43-绘图
//
//  Created by shadandan on 16/7/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "YellowView.h"

@implementation YellowView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //1.获取上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //2.拼接路径
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 150, 50);
    //CGContextAddLineToPoint(ctx, 50, 50);//可以这样画三角形也可以用关闭路径的方法
    //关闭路径
    CGContextClosePath(ctx);
    
    CGContextSetLineWidth(ctx, 10);//必须设置线宽，才能看见描边颜色的效果
    
    //3.渲染， c方式渲染
    //CGContextStrokePath(ctx);//描边
    //CGContextFillPath(ctx);//填充
    
    //kCGPathFill//填充等价于CGContextFillPath(ctx);
    //kCGPathEOFill//奇偶填充规则填充描边
    //kCGPathStroke//描边等价于CGContextStrokePath(ctx);
    //kCGPathFillStroke//既描边又填充
    //kCGPathEOFillStroke//奇偶填充规则填充和描边
    [[UIColor redColor]setFill];//设置填充的颜色
    [[UIColor whiteColor]setStroke];//设置描边的颜色
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    
    //创建路径
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 100)];
    [path addLineToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(150, 100)];
    [path closePath];
    [path setLineWidth:10];//必须设置线宽，才能看见描边颜色的效果
    //设置颜色
    [[UIColor whiteColor]setStroke];//设置描边的颜色
    [[UIColor redColor]setFill];//设置填充的颜色
    //[[UIColor redColor]set];//描边或填充都可以设置
     //oc方式渲染
    [path stroke];//描边
    [path fill];//填充
    
}


@end
