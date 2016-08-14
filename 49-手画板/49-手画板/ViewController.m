//
//  ViewController.m
//  49-手画板
//
//  Created by shadandan on 16/8/14.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet DrawView *drawView;
@property (weak, nonatomic) IBOutlet UISlider *lineWidthProgress;
@property (weak, nonatomic) IBOutlet UIButton *redBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.drawView.lineWidth=self.lineWidthProgress.value;
    //模拟点击第一个按钮，实现第一次画的线就是红色的，否则是黑色的
    [self lineColer:self.redBtn];
}
- (IBAction)changeLineWidth:(UISlider *)sender {
    self.drawView.lineWidth=sender.value;//传递线宽
    
}
- (IBAction)lineColer:(UIButton *)sender {
    self.drawView.lineColor=sender.backgroundColor;
}
- (IBAction)save:(UIButton *)sender {
    //开启图片类型的上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    //获取上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    //截图
    [self.drawView.layer renderInContext:ctx];
    //取图片
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    //保存到相册
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}
- (IBAction)clearClick:(id)sender {
    [self.drawView clear];
}
- (IBAction)backClick:(id)sender {
    [self.drawView back];
}
- (IBAction)rubberClick:(id)sender {
    [self.drawView rubber];
}

@end
