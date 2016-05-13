//
//  LoginSuccessViewController.m
//  2016.5.11.NavigationWithLoginTest
//
//  Created by whunf on 16/5/11.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "LoginSuccessViewController.h"

@interface LoginSuccessViewController ()

@end

@implementation LoginSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lblSuccess = [[UILabel alloc]initWithFrame:(CGRect){100,100,120,30}];
    lblSuccess.text = @"登陆成功";
    lblSuccess.textColor = [UIColor redColor];
    [self.view addSubview:lblSuccess];
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
