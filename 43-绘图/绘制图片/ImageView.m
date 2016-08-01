//
//  ImageView.m
//  43-绘图
//
//  Created by shadandan on 16/8/1.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ImageView.h"

@implementation ImageView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //
    

    UIImage *image2=[UIImage imageNamed:@"bg"];
    //平铺（铺满）
    [image2 drawAsPatternInRect:rect];
    
    UIImage *image=[UIImage imageNamed:@"h_main_AdgY_1f85000000c6111a"];
    //从某一个点开始绘制
    [image drawAtPoint:CGPointZero];
    //绘制到某一个区域(拉伸)
    [image drawInRect:rect];

}


@end
