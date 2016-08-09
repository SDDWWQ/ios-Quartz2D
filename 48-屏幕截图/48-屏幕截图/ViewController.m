//
//  ViewController.m
//  48-屏幕截图
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
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0);
    //截屏，即将某个View画到图片上下文中
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    //取图片
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
    UIGraphicsEndImageContext();
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
