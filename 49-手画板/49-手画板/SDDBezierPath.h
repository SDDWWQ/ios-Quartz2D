//
//  SDDBezierPath.h
//  49-手画板
//
//  Created by shadandan on 16/8/14.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import <UIKit/UIKit.h>
//因为系统没有提供BezierPath的颜色的属性，有设置线宽的属性，要想实现设置path的颜色，就要自定义一个类继承自UIBezierPath，再添加一个自定义颜色属性
@interface SDDBezierPath : UIBezierPath
@property(nonatomic,strong)UIColor *color;
@end
