//
//  SDDView.m
//  43-绘图
//
//  Created by shadandan on 16/7/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "SDDView.h"

@implementation SDDView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // 方式1：C语言的
    //1.获取图形上下文（layer）就是获取和当前UIView一样大小的草稿纸CGContextRef是枚举类型，所以变量不用加*
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //2.拼接路径 同时 放到上下文当中
    CGContextMoveToPoint(ctx, 50, 50);//起点
    CGContextAddLineToPoint(ctx, 100, 100);//终点，笔移动到点画线
    CGContextAddLineToPoint(ctx, 150, 50);//终点
    
    CGContextMoveToPoint(ctx, 200, 50);//起点，把笔抬起来移动到点
    CGContextAddLineToPoint(ctx, 250, 50);//终点
    
    //设置样式，要在渲染之前
    //线宽
    CGContextSetLineWidth(ctx, 30);
    //设置连接处的样式
    //kCGLineJoinMiter：默认
    //kCGLineJoinRound：圆角
    //kCGLineJoinBevel：切角
    CGContextSetLineJoin(ctx, kCGLineCapRound);
    //设置头尾的样式
    //kCGLineCapButt:默认
    //kCGLineCapRound：圆角
    //kCGLineCapSquare：两边增加宽度
    CGContextSetLineCap(ctx, kCGLineCapButt);
    //设置颜色
    CGContextSetRGBStrokeColor(ctx, 1, 1,1, 1);//rgb的值是0-1之间的数
    
    //3.渲染，相当于把草稿纸上的图形移动到当前UIView上展示
    CGContextStrokePath(ctx);
    
    
    //方式2：C语言的
    //1.获取图形上下文
    CGContextRef ctx2=UIGraphicsGetCurrentContext();
    //2.拼接路径
    CGMutablePathRef path=CGPathCreateMutable();//创建一个可变的路径
    CGPathMoveToPoint(path, NULL, 50, 150);
    CGPathAddLineToPoint(path, NULL, 100, 200);

    //3.把路径添加到上下文当中
    CGContextAddPath(ctx2, path);
    //4.渲染
    CGContextStrokePath(ctx2);
    
    //方式3：C语言+OC
    //1.获取图形上下文
    CGContextRef ctx3=UIGraphicsGetCurrentContext();
    //2.拼接路径(OC)
    UIBezierPath *path3=[[UIBezierPath alloc]init];
    [path3 moveToPoint:CGPointMake(50, 250)];
    [path3 addLineToPoint:CGPointMake(100, 300)];
    //3.把路径添加到上下文当中
    CGContextAddPath(ctx3, path3.CGPath);//第二个参数是C语言中的CGPath类型，所以要将OC的path转换为C语言的path，可以通过.CGPath的方式转化
    //4.渲染
    CGContextStrokePath(ctx3);

    //方式4：C语言+OC
    //1.获取图形上下文
    CGContextRef ctx4=UIGraphicsGetCurrentContext();
    //2.拼接路径(c)
    CGMutablePathRef path4=CGPathCreateMutable();
    CGPathMoveToPoint(path4, NULL, 50, 350);
    CGPathAddLineToPoint(path4, NULL, 100, 400);
    //3.根据c的p路径 创建oc的路径
    UIBezierPath *path44=[UIBezierPath bezierPathWithCGPath:path4];
    [path44 addLineToPoint:CGPointMake(150, 350)];//接着c去画的
    //34把路径添加到上下文当中
    CGContextAddPath(ctx3, path44.CGPath);//第二个参数是C语言中的CGPath类型，所以要将OC的path转换为C语言的path，可以通过.CGPath的方式转化
    //5.渲染
    CGContextStrokePath(ctx3);
                          
    
    //方式5：OC
    //1.创建路径
    UIBezierPath *path5=[UIBezierPath bezierPath];
    [path5 moveToPoint:CGPointMake(50, 450)];
    [path5 addLineToPoint:CGPointMake(100, 500)];
    
    //设置样式（oc）
    //线宽
    [path5 setLineWidth:20];
    //连接处的样式
    [path5 setLineJoinStyle:kCGLineJoinRound];
    //头尾的样式
    [path5 setLineCapStyle:kCGLineCapRound];
    //设置颜色
    [[UIColor redColor]setStroke];//或者[[UIColor colorWithRed:<#(CGFloat)#> green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>]stroke];
    
    //2.渲染
    [path5 stroke];
    
    //画矩形
    UIBezierPath *rectPath=[UIBezierPath bezierPathWithRect:CGRectMake(150, 150, 100, 100)];
    //渲染
    [rectPath stroke];
    
    //画圆角矩形
    UIBezierPath *roundRectPath=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(150, 250, 100, 100)cornerRadius:20];//，宽度是100，若想成为一个圆，半径应该设成50，注意：当设置半径的值大于等于2/3半径时就会展现成一个圆，小于2/3半径时就会展现成圆角矩形
    //渲染
    [roundRectPath stroke];
    
    //画椭圆oc的方法：
    UIBezierPath *oralPath=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(150, 350, 200, 100)];//椭圆是在设定的矩形内部画出的
    //渲染
    [oralPath stroke];
    //画椭圆c的方法：
    //1.获取图形上下文
    CGContextRef oralctx=UIGraphicsGetCurrentContext();
    //2.拼接路径同时把路径添加到上下文当中
    CGContextAddEllipseInRect(oralctx, CGRectMake(150, 450, 200, 100));
    //3.渲染
    CGContextStrokePath(oralctx);
    
    //画弧oc方法：
    //路径：ArcCenter:圆心、radius:半径、startAngle:起始角度、endAngle:结束角度、clockwise:是否是顺时针
    UIBezierPath *arcPath=[UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 600) radius:50 startAngle:0 endAngle:M_PI clockwise:YES];//0弧度表示起点是3点钟方向
    //渲染
    [arcPath stroke];
    //画弧c的方法：
    //1.获取图形上下文
    CGContextRef arcctx=UIGraphicsGetCurrentContext();
    //2.拼接路径同时把路径添加到上下文当中
    CGContextAddArc(arcctx, 200, 600, 50, 0, M_PI_2, YES);//c的方法顺时针和逆时针是反着的
    //3.渲染
    CGContextStrokePath(arcctx);


}


@end
