//
//  ViewController.m
//  45-bitmap图片裁剪
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
    UIImage *image=[UIImage imageNamed:@"h_main_AdgY_1f85000000c6111a"];
    //开启图片类型的上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextAddArc(ctx, image.size.width*0.5, image.size.height*0.5, image.size.width*0.5, 150, 0, 2*M_PI);
    CGContextClip(ctx);
    //先把图片画到图片类型的上下文中
    [image drawAtPoint:CGPointZero];
    //从当前图片上下文中取图片，实际上还是一个方形的图片，只不过背景是透明的
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
   //关闭图形上下文
    UIGraphicsEndImageContext();
    self.imageView.image=newImage;
}
@end
