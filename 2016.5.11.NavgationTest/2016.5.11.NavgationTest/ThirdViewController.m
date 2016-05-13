//
//  ThirdViewController.m
//  2016.5.11.NavgationTest
//
//  Created by whunf on 16/5/11.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
{
    UIButton *_button;
}
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        NSLog(@"%@",self.navigationController.childViewControllers);
    [self setTitle:@"第三个页面"];
    [self.view setBackgroundColor:[UIColor redColor]];
    [self initWithButton];
}

#pragma mark 跳转按钮初始化
- (void)initWithButton
{
    _button = [[UIButton alloc]initWithFrame:(CGRect){100,100,120,30}];
    [_button setTitle:@"跳转" forState:UIControlStateNormal];
    [_button setBackgroundColor:[UIColor blackColor]];
    [_button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

- (void)buttonAction:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)dealloc
//{
//    NSLog(@"third销毁");
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
