//
//  ViewController.m
//  2016.5.6PassValue
//
//  Created by whunf on 16/5/6.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIButton *_blockBtn;
    UIButton *_delegateBtn;
    UIButton *_userDefaultsBtn;
    UIButton *_notificationBtn;
    SecondViewController *_secondViewCTL;
}
@end

@implementation ViewController

#pragma  mark - 控制器的生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"A加载了");
    [self initWithPassValueButton];
    _secondViewCTL = [[SecondViewController alloc]init];
    self.delegate = _secondViewCTL;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"A即将显示");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"A已经显示");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"A即将消失");
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"A已经消失");
}


#pragma mark  - 跳转按钮初始化
- (void)initWithPassValueButton
{
#pragma mark blcok传值按钮
    _blockBtn = [[UIButton alloc]initWithFrame:(CGRect){100,100,150,20}];
    [_blockBtn setTitle:@"Block传值" forState:UIControlStateNormal];
    [_blockBtn setBackgroundColor:[UIColor blackColor]];
    [_blockBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_blockBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    _blockBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _blockBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_blockBtn addTarget:self action:@selector(blockBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_blockBtn];
    
#pragma mark delegate传值按钮
    _delegateBtn = [[UIButton alloc]initWithFrame:(CGRect){100,_blockBtn.frame.origin.y + _blockBtn.frame.size.height+10,150,20}];
    [_delegateBtn setBackgroundColor:[UIColor blackColor]];
    [_delegateBtn setTitle:@"Delegate传值" forState:UIControlStateNormal];
    [_delegateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_delegateBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    _delegateBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _delegateBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_delegateBtn addTarget:self action:@selector(delegateBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_delegateBtn];
    
#pragma mark NSUserDefaults传值按钮
    _userDefaultsBtn = [[UIButton alloc]initWithFrame:(CGRect){100,_delegateBtn.frame.origin.y + _delegateBtn.frame.size.height+10,150,20}];
    [_userDefaultsBtn setBackgroundColor:[UIColor blackColor]];
    [_userDefaultsBtn setTitle:@"NSUserDefaults传值" forState:UIControlStateNormal];
    [_userDefaultsBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_userDefaultsBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    _userDefaultsBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _userDefaultsBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_userDefaultsBtn addTarget:self action:@selector(userDefaultsBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_userDefaultsBtn];
    
#pragma mark 通知传值按钮
    _notificationBtn = [[UIButton alloc]initWithFrame:(CGRect){100,_userDefaultsBtn.frame.origin.y + _userDefaultsBtn.frame.size.height+10,150,20}];
    [_notificationBtn setBackgroundColor:[UIColor blackColor]];
    [_notificationBtn setTitle:@"通知传值" forState:UIControlStateNormal];
    [_notificationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_notificationBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    _notificationBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _notificationBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_notificationBtn addTarget:self action:@selector(notificationBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_notificationBtn];
}

#pragma mark - 跳转按钮点击事件
#pragma mark block传值按钮事件
- (void)blockBtnAction:(id)sender
{
    //将Block按钮的值传给第二个页面的按钮
    //_blockBtn.currentTitle 也可以获取按钮的标签
    NSString *blockValue = _blockBtn.titleLabel.text;
    [_secondViewCTL setBlockBtnValue:^NSString *{
        return blockValue;
    }];
    
    [self presentViewController:_secondViewCTL animated:YES completion:nil];
}

#pragma mark delegate传值按钮事件
- (void)delegateBtnAction:(id)sender
{
    [self.delegate passValueWithDelegate:_delegateBtn.titleLabel.text];
    [self presentViewController:_secondViewCTL animated:YES completion:nil];
}

#pragma mark userDefaults传值按钮事件
- (void)userDefaultsBtnAction:(id)sender
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:_userDefaultsBtn.titleLabel.text forKey:@"userPassValue"];
    [userDefaults synchronize];
   [self presentViewController:_secondViewCTL animated:YES completion:nil];
}

#pragma mark 通知传值按钮事件
- (void)notificationBtnAction:(id)sender
{
    //注册通知
    [_secondViewCTL addObserverNotification];
    //发送消息
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noti" object:_notificationBtn.titleLabel.text];
    [self presentViewController:_secondViewCTL animated:YES completion:nil];
}

- (void)dealloc
{
    NSLog(@"ViewController页面被销毁");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
