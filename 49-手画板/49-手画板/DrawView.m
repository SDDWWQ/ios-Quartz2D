//
//  DrawView.m
//  49-手画板
//
//  Created by shadandan on 16/8/14.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "DrawView.h"
#import "SDDBezierPath.h"
@interface DrawView()
//@property(nonatomic,strong)SDDBezierPath *path;
@property(nonatomic,strong)NSMutableArray *pathes;

@end
@implementation DrawView

-(NSMutableArray *)pathes{
    if (!_pathes) {
        _pathes=[NSMutableArray array];
    }
    return _pathes;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //NSLog(@"%ld",self.pathes.count);
    for (int i=0; i<self.pathes.count; i++) {
        SDDBezierPath *path=self.pathes[i];
        [path.color set];//利用自定义的color属性设置每个路径的颜色
        [path stroke];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=touches.anyObject;
    CGPoint p=[touch locationInView:self];
    SDDBezierPath *path=[SDDBezierPath bezierPath];
    [path moveToPoint:p];
    [path setLineWidth:self.lineWidth];//设置线宽 lineWidth是系统提供的属性
    [path setColor:self.lineColor];//设置颜色，color是我们自定义的属性
    [path setLineJoinStyle:kCGLineJoinRound];//设置连接处的样式
    [path setLineCapStyle:kCGLineCapRound];//设置头尾处样式
    [self.pathes addObject:path];
    
    //self.path=path;
    
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=touches.anyObject;
    CGPoint p=[touch locationInView:self];
    [[self.pathes lastObject] addLineToPoint:p];
    
    [self setNeedsDisplay];
}
-(void)clear{
    [self.pathes removeAllObjects];
    [self setNeedsDisplay];
}
-(void)back{
    [self.pathes removeLastObject];
    [self setNeedsDisplay];
}
-(void)rubber{
    self.lineColor=self.backgroundColor;
}
@end
