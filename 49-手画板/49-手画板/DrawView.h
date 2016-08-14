//
//  DrawView.h
//  49-手画板
//
//  Created by shadandan on 16/8/14.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
@property(nonatomic,assign)CGFloat lineWidth;
@property(nonatomic,strong)UIColor *lineColor;
-(void)clear;
-(void)back;
-(void)rubber;
@end
