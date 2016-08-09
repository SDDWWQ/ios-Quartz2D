//
//  ViewController.m
//  46-bitmap实现带圆环的图片
//
//  Created by shadandan on 16/8/9.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGFloat margin=10;
    UIImage *image=[UIImage imageNamed:@"h_main_AdgY_1f85000000c6111a"];
    //上下文大小
    CGSize ctxSize=CGSizeMake(image.size.width+2*margin,image.size.height+2*margin);
    UIGraphicsBeginImageContextWithOptions(ctxSize, NO, 0);
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //计算圆心位置
    CGPoint arcCenter=CGPointMake(ctxSize.width*0.5, ctxSize.height*0.5);
    //计算圆环半径
    CGFloat radius=image.size.width*0.5+margin*0.5;
    //画圆环
    CGContextAddArc(ctx,arcCenter.x , arcCenter.y, radius, 0, 2*M_PI, 1);
    //设置圆的线宽
    CGContextSetLineWidth(ctx, margin);
    //渲染
    CGContextStrokePath(ctx);
    //裁剪显示区域
    CGContextAddArc(ctx, arcCenter.x, arcCenter.y, image.size.width*0.5,0, 2*M_PI, 1);
    CGContextClip(ctx);
    [image drawInRect:CGRectMake(margin, margin, image.size.width, image.size.height)];
    image=UIGraphicsGetImageFromCurrentImageContext();
    //保存到手机相册
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
    //UIGraphicsEndImageContext();
    
}
@end
