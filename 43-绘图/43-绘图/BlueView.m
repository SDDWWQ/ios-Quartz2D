//
//  BlueView.m
//  43-绘图
//
//  Created by shadandan on 16/7/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView

+(instancetype)pieChart{
    return [[NSBundle mainBundle]loadNibNamed:@"PieChart" owner:nil options:nil][0];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    //如果view宽高不相等，报异常，不让使用
    if (!(rect.size.width==rect.size.height)) {//参数rect是当前view
        //[NSException raise:@"view frame宽高不一致" format:@"请将view的宽高设为相同值"];
        //或
        NSException *exception=[NSException exceptionWithName:@"view frame宽高不一致" reason:@"请将view的宽高设为相同值" userInfo:nil];
        [exception raise];//把异常抛出去
    }else{
    // 数据
    CGFloat start=0;
    CGFloat end=0;
    for (int i=0; i<self.value.count; i++) {
        end=end+2*M_PI*([self.value[i] floatValue]);
        // 扇形
        UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:[self arcCenter] radius:MIN(self.bounds.size.width, self.bounds.size.height)*0.5-10 startAngle:start endAngle:end clockwise:YES];
        //画扇形的时候要画一条半径才能连上
        [path addLineToPoint:[self arcCenter]];
        //设置随机颜色
        [[self randomColor]setFill];
        //渲染
        [path fill];//填充方式的渲染，会自动封闭
        start=end;
    }
    }
    
}
//获取当前View的中心点
-(CGPoint)arcCenter{
    return CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5);
}
//随机生成颜色
-(UIColor *)randomColor{
    return [UIColor colorWithRed:(float)(arc4random_uniform(256)/255.0) green:(float)(arc4random_uniform(256)/255.0) blue:(float)(arc4random_uniform(256)/255.0) alpha:1.0];
}
//点击这个View的时候调用
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //重绘
    [self setNeedsDisplay];
    //[self setNeedsDisplayInRect:CGRectMake(0, 0, 150, 150)];//重绘某一个区域
}
@end
