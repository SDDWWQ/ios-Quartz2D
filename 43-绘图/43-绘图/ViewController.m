//
//  ViewController.m
//  43-绘图
//
//  Created by shadandan on 16/7/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"
#import "BlueView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *array=@[@0.3,@0.2,@0.1,@0.4];
    BlueView *view=[BlueView pieChart];
    view.value=array;
    view.frame=CGRectMake(0, 0, 300, 300);
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
