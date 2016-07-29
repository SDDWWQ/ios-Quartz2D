//
//  ProgressViewController.m
//  43-绘图
//
//  Created by shadandan on 16/7/29.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ProgressViewController.h"
#import "ProgressView.h"
@interface ProgressViewController ()
@property (weak, nonatomic) IBOutlet ProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;

@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//监听滚动条
- (IBAction)progressChange:(UISlider *)sender {
    NSLog(@"%f",sender.value);
    self.progressView.value=sender.value;
    self.percentLabel.text=[NSString stringWithFormat:@"%.2f%%",sender.value*100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
