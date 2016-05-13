//
//  ViewController.m
//  2016.5.12.ProgressView
//
//  Created by whunf on 16/5/12.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIProgressView *progress;
    UILabel *label;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIProgressView 进度条
    [self initWithProgress];
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(loadData) userInfo:nil repeats:YES];
}

#pragma mark 进度条初始化
- (void)initWithProgress
{
    progress = [[UIProgressView alloc]initWithFrame:(CGRect){80,100,120,20}];
    //进度条的风格
    //UIProgressViewStyleDefault 标准进度条
    //UIProgressViewStyleBar   深灰色进度条
    progress.progressViewStyle = UIProgressViewStyleBar;
    //进度条的值是一个0.0到1.0之间的浮点数
    //当前的进度值
    progress.progress = 0.0;
    //已经走过的进度条的颜色
    progress.progressTintColor = [UIColor redColor];
    //为走过的进度条颜色
    progress.trackTintColor = [UIColor blackColor];
    //设置走过的进度条的图片
//    progress.progressImage = [UIImage imageNamed:@"start"];
//    //设置为走过的进度条的图片
//    progress.trackImage = [UIImage imageNamed:@"selected"];
    //改变进度条的高度
    progress.transform  = CGAffineTransformMakeScale(1.0f, 15.0f);
    [self.view addSubview:progress];
    
    //标签
    CGRect rect = progress.frame;
    rect.origin.x+=progress.frame.size.width/2;
    label = [[UILabel alloc]initWithFrame:rect];
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
}

- (void)loadData
{
    //设置进度条的值加0.1;
    progress.progress+=0.01;
//    算出当前进度的比例
    CGFloat val = progress.progress/1.0;
    label.text = [NSString stringWithFormat:@"%0.1f﹪",val*100];
    if(progress.progress==1)
        progress.progress = 0.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
