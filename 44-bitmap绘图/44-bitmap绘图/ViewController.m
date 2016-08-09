//
//  ViewController.m
//  44-bitmap绘图
//
//  Created by shadandan on 16/8/1.
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
    //1.开启一个图片类型的上下文,最后画到UIImage上（即输出目标是UIImage）
    //方法一：UIGraphicsBeginImageContext(CGSizeMake(200, 200));
    CGFloat scale=[UIScreen mainScreen].scale;//scale就是屏幕的@1X、@2X、@3X中的数字，根据手机的屏幕分辨率来输出
    //方法二： BOOL opaque表示不透明, CGFloat scale表示缩放倍数
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), NO, scale);//第二个参数传NO表示透明，第三个参数传1和方法一是一样效果的，就是生成一个200*200像素的图片，传2代表扩大成2倍，像素变为400*400,如果传0就相当于传scale
    
    //2.获取当前的上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //3.画圆
    CGContextAddArc(ctx, 100, 100, 80, 0, 2*M_PI, 1);
    //4.渲染到图片
    CGContextStrokePath(ctx);
    //5.取图片
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    //关闭图片类型的图形上下文
    UIGraphicsEndImageContext();
    self.imageView.image=image;
    
    //保存到沙盒
    //1.把image对象转化成data
    NSData *data=UIImagePNGRepresentation(image);
    //2.获取Document路径
    NSString *docPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath=[docPath stringByAppendingPathComponent:@"xx.png"];
    //2.通过data对象writeToFile保存到沙盒
    [data writeToFile:filePath atomically:YES];//atomatically表示线程安全的，不是直接往沙盒里写，先往缓冲区里写，如果此时断电了，沙盒里什么都没有，原来的东西也还在，缓冲区中的没了，就要重新写一次，一般都也YES
    
}
@end
