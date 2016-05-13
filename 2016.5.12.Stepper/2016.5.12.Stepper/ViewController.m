//
//  ViewController.m
//  2016.5.12.Stepper
//
//  Created by whunf on 16/5/12.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *imageView;
    UIStepper *stepper;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithStepper];
    
}

#pragma mark 计数器初始化
- (void)initWithStepper
{
    imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"image1"]];
    imageView.frame = self.view.frame;
    [self.view addSubview:imageView];
    
    stepper = [[UIStepper alloc]initWithFrame:(CGRect){120,100,100,20}];
    stepper.value = 0.1;    //默认值
    stepper.stepValue = 0.1;    //每次步骤计算的大小
    stepper.maximumValue = 1;   //最大值
    stepper.minimumValue = 0;   //最小值
    stepper.continuous = YES;   //是否持续触发ValueChanged事件
    stepper.autorepeat = YES;   //是否在按住时自动持续递增或者递减
    stepper.wraps = YES;        //在最大值和最小值之间形成循环
    [stepper addTarget:self action:@selector(stepperAction) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper];
}
#pragma mark  计数器事件
- (void)stepperAction
{
    NSLog(@"%g",stepper.value );
    imageView.alpha = stepper.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
