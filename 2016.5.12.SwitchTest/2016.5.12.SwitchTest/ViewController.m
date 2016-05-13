//
//  ViewController.m
//  2016.5.12.SwitchTest
//
//  Created by whunf on 16/5/12.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithSwitch];
    
}

#pragma mark 开关按钮
- (void)initWithSwitch
{
    UISwitch *_switch = [[UISwitch alloc]initWithFrame:(CGRect){120,100,50,30}];
    //设置On时候的颜色
    [_switch setOnTintColor:[UIColor redColor]];
    //设置Off时候的边框色
    [_switch setTintColor:[UIColor cyanColor]];
    //设置按钮颜色
    [_switch setThumbTintColor:[UIColor blackColor]];
    //添加事件
    [_switch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_switch];
}

#pragma mark 开关按钮事件
- (void)switchAction:(id)sender
{
    UISwitch *_switch = sender;
    if(_switch.isOn)
    {
        [self.view setBackgroundColor:[UIColor cyanColor]];
    }else
        [self.view setBackgroundColor:[UIColor greenColor]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
