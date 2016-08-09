//
//  ViewController.m
//  47-添加水印
//
//  Created by shadandan on 16/8/9.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [image drawAtPoint:CGPointZero];//不用获取图形上下文，因为系统已经为我们封装好了
    //画文字的水印
    NSString *str=@"sdd";
    [str drawAtPoint:CGPointMake(20,20) withAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    UIImage *logo=[UIImage imageNamed:@"6904843_133128237162_2"];
    [logo drawAtPoint:CGPointMake(image.size.width-logo.size.width, image.size.height-logo.size.height)];
    image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
}
@end
