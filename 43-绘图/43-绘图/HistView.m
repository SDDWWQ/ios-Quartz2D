//
//  HistView.m
//  43-绘图
//
//  Created by shadandan on 16/7/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "HistView.h"

@implementation HistView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //数据
    NSArray *array=@[@0.5,@0.8,@1,@0.2,@0.4];
    for (int i=0; i<array.count; i++) {
        //计算x,y,宽，高
        CGFloat w=20;
        CGFloat h=rect.size.height*[array[i] floatValue];
        CGFloat x=i*2*w;
        CGFloat y=rect.size.height-h;
        UIBezierPath *path=[UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        //设置随机颜色
        [[self randomColor]setFill];
        [path fill];
        
    }
    
}

//随机生成颜色
-(UIColor *)randomColor{
    return [UIColor colorWithRed:(float)(arc4random_uniform(256)/255.0) green:(float)(arc4random_uniform(256)/255.0) blue:(float)(arc4random_uniform(256)/255.0) alpha:1.0];
}
@end
