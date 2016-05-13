//
//  ViewController.m
//  2016.5.12.AlertAction
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
    //对话框
    [self initWithAlert];
}
#pragma mark 按钮初始化
- (void)initWithAlert
{
    UIButton *button = [[UIButton alloc]initWithFrame:(CGRect){120,100,120,30}];
    [button setTitle:@"普通对话框" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor blackColor]];
     [self.view addSubview:button];
    
    UIButton *bottomActionBtn = [[UIButton alloc]initWithFrame:(CGRect){120,140,120,30}];
    [bottomActionBtn setTitle:@"底部对话框" forState:UIControlStateNormal];
    [bottomActionBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [bottomActionBtn addTarget:self action:@selector(bottomBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [bottomActionBtn setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:bottomActionBtn];
    
    UIButton *oldActionBtn = [[UIButton alloc]initWithFrame:(CGRect){120,180,120,30}];
    [oldActionBtn setTitle:@"旧版对话框" forState:UIControlStateNormal];
    [oldActionBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [oldActionBtn addTarget:self action:@selector(oldBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [oldActionBtn setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:oldActionBtn];
    
    UIButton *textActionBtn = [[UIButton alloc]initWithFrame:(CGRect){120,220,120,30}];
    [textActionBtn setTitle:@"文本对话框" forState:UIControlStateNormal];
    [textActionBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [textActionBtn addTarget:self action:@selector(textBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [textActionBtn setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:textActionBtn];
}

#pragma mark 文本对话框
- (void)textBtnAction
{
    UIAlertController *alertCTL = [UIAlertController alertControllerWithTitle:@"提示" message:@"文本对话框" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertCTL addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //获取文本框
        UITextField *txtUsername = alertCTL.textFields.firstObject;
        UITextField *txtPassWord = alertCTL.textFields.lastObject;
        
        NSLog(@"用户名:%@ 密码:%@",txtUsername.text,txtPassWord.text);
    }]];
    
    //将文本框依次添加到UIAlertController中的textFields中去
    [alertCTL addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入用户名";
    }];
    
    [alertCTL addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入密码";
        textField.secureTextEntry = YES;
    }];
    
    //跳转到对话框控制器
    [self presentViewController:alertCTL animated:YES completion:nil];
}


#pragma mark 旧版对话框
- (void)oldBtnAction
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"标题" message:@"旧版照样用" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
    [alert show];
}

#pragma mark 按钮点击事件
- (void)buttonAction:(id)sender
{
    //先构建一个对话框控制器
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"标题" message:@"这一个非常悲伤的故事，编程太难了" preferredStyle:UIAlertControllerStyleAlert];
    
    //按钮模式
    //UIAlertActionStyleDefault 默认蓝色字体
    //UIAlertActionStyleCancel 加粗显示
    //UIAlertActionStyleDestructive 字体红色显示
    
    //设定按钮
    UIAlertAction *actionTure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //当点击该按钮做的事情
        NSLog(@"确定");
    }];
    
    UIAlertAction *actionCanel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //当点击该按钮做的事情
        NSLog(@"取消");
    }];
    
    UIAlertAction *actionWarning = [UIAlertAction actionWithTitle:@"警告" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"警告");
    }];
    
    //将按钮添加到对话框控制器中
    //超过两个将会以竖排显示
    [alert addAction:actionCanel];
    [alert addAction:actionTure];
    [alert addAction:actionWarning];
    
    //跳转到对话框
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark 底部对话框
- (void)bottomBtnAction
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"标题" message:@"天哪，我竟然在底部" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"底部");
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
