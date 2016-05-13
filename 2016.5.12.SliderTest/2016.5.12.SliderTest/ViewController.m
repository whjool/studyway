//
//  ViewController.m
//  2016.5.12.SliderTest
//
//  Created by whunf on 16/5/12.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *view;
    UISlider *sliderR;
    UISlider *sliderG;
    UISlider *sliderB;
}
@end

@implementation ViewController

- (void)viewDidLoad {
   [super viewDidLoad];
    
    [self initWithSlider];
    
}

#pragma mark Slider初始化
- (void)initWithSlider
{
    sliderR = [[UISlider alloc]initWithFrame:(CGRect){80,100,255,10}];
    sliderR.maximumValue = 255.0; //设定滑动条最大值
    sliderR.minimumValue = 0.0; //设定滑动条最小值
     sliderR.value = 0;  //设定滑动条当前的值
    [sliderR addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sliderR];
    sliderG = [[UISlider alloc]initWithFrame:(CGRect){80,160,255,10}];
    sliderG.value = 0;
    sliderG.maximumValue = 255.0;
    sliderG.minimumValue = 0.0;
    [sliderG addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sliderG];
    
    sliderB = [[UISlider alloc]initWithFrame:(CGRect){80,220,255,10}];
    sliderB.value = 0;
    sliderB.maximumValue = 255.0;
    sliderB.minimumValue = 0.0;
    [sliderB addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sliderB];
    
    view = [[UIView alloc]initWithFrame:(CGRect){80,250,200,200}];
    [view setBackgroundColor:[UIColor
                              colorWithRed:sliderR.value/255.0
                              green:sliderG.value/255.0
                              blue:sliderB.value/255.0 alpha:1]];
    [self.view addSubview:view];
   

}

#pragma mark 滑动条事件
- (void)sliderAction:(id)sender
{
    [view setBackgroundColor:[UIColor
       colorWithRed:sliderR.value/255.0
       green:sliderG.value/255.0
       blue:sliderB.value/255.0 alpha:1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
