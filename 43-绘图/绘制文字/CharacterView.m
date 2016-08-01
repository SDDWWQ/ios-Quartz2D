//
//  CharacterView.m
//  43-绘图
//
//  Created by shadandan on 16/8/1.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "CharacterView.h"

@implementation CharacterView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    NSString *str=@"sddwwqsddwwqsddwwqsddwwqsddwwqsddwwqsddwwqsddwwqsddwwqsddwwqsddwwqsddwwq";
    // 从某一点开始绘制
    //[str drawAtPoint:CGPointZero withAttributes:nil];//CGPointZero表示从0，0点开始画，也可以用CGPointMake(50,50)
    NSShadow *s=[[NSShadow alloc]init];
    s.shadowOffset=CGSizeMake(50, 50);
    s.shadowBlurRadius=2;//模糊半径，越大越模糊
    s.shadowColor=[UIColor blueColor];
    [str drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor],NSUnderlineStyleAttributeName:@(5),NSShadowAttributeName:s}];//第二个参数是一个字典可以传nil也可以随便选择键值对，设置文字的样式,NSFontAttributeName:设置字体大小；NSBackgroundColorAttributeName：设置背景颜色；NSForegroundColorAttributeName：设置前景文字颜色；NSUnderlineStyleAttributeName：设置文字下面的横线，参数是线的粗细程度;NSShadowAttributeName:设置模糊的文字（把背景颜色去掉，且得有下划线才能显示），还有很多键值对可以设置，具体可以command点进去看
    //以某个固定的frame来绘制
    //[str drawInRect:rect withAttributes:nil];//以当前view的宽度绘制，当文字很长的时候可以自动换行
    
}


@end
