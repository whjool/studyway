//
//  SecondViewController.m
//  2016.5.11.NavgationTest
//
//  Created by whunf on 16/5/11.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()
{
    UIButton *_button;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        NSLog(@"%@",self.navigationController.childViewControllers);
    [self setTitle:@"第二个页面"];
    [self.view setBackgroundColor:[UIColor cyanColor]];
    [self initWithButton];
    
    //左按钮
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(leftBtnAction)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    //右按钮
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBtnAction)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

//左按钮事件
- (void)leftBtnAction
{
    [self.navigationController popViewControllerAnimated:NO];
}

//右按钮事件
- (void)rightBtnAction
{
    NSLog(@"点击了右按钮");
    ThirdViewController *secondView = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:secondView animated:NO];
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
    ThirdViewController *thirdView = [[ThirdViewController alloc]init];
    [self.navigationController pushViewController:thirdView animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)dealloc
//{
//    NSLog(@"second销毁");
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
