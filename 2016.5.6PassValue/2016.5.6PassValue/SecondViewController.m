//
//  SecondViewController.m
//  2016.5.6PassValue
//
//  Created by whunf on 16/5/6.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController ()
{
    NSString *delegateValue;    //获取代理传过来的值
    NSString *userValue;        //获取NSUserDefaults传过来的值
    NSString *notiValue;        //获取通知传过来的值
}
@property (nonatomic,strong)UIButton *blockBtn; //block按钮
@property (nonatomic,strong)UIButton *delegateBtn;//代理按钮
@property (nonatomic,strong)UIButton *userDefaultsBtn;//NSUserDefaults按钮
@property (nonatomic,strong)UIButton *notificationBtn;
@end

@implementation SecondViewController

#pragma mark 页面即将显示
- (void)viewWillAppear:(BOOL)animated
{
     NSLog(@"B即将显示");
    //block传值
    if(_blcokCallBack)
        //设置block按钮的值
        [_blockBtn setTitle:_blcokCallBack() forState:UIControlStateNormal];
    //代理传值
    if(delegateValue)
        //设置代理按钮的值
        [_delegateBtn setTitle:delegateValue forState:UIControlStateNormal];
    
    //NSUserDefaults传值
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //获取NSUserDefaults里设置的值
    userValue = [userDefaults objectForKey:@"userPassValue"];
    NSLog(@"userValue: %@",userValue);
    if(userValue)
    {
        //设置userDefaults按钮的标题
        [_userDefaultsBtn setTitle:userValue forState:UIControlStateNormal];
    }
    
    //通知消息
    if(notiValue)
    {
        [_notificationBtn setTitle:notiValue forState:UIControlStateNormal];
    }
}

#pragma mark 页面加载完毕
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithShowValueButton];
     NSLog(@"B加载完毕");
//    //block传值
//    if(_blcokCallBack)
//        [_blockBtn setTitle:_blcokCallBack() forState:UIControlStateNormal];
//    //代理传值
//    if(delegateValue)
//        [_delegateBtn setTitle:delegateValue forState:UIControlStateNormal];
//    //NSUserDefaults传值
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    userValue = [userDefaults objectForKey:@"userPassValue"];
//    NSLog(@"userValue: %@",userValue);
//    if(![userValue isEqualToString:@""])
//    {
//        [_userDefaultsBtn setTitle:userValue forState:UIControlStateNormal];
//    }
//    //通知消息
//    if(notiValue)
//    {
//        [_notificationBtn setTitle:notiValue forState:UIControlStateNormal];
//    }

}
#pragma mark 为当前页面注册通知
//使得当前页面可以接收通知中心发过来的消息
- (void)addObserverNotification
{
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(getNotificationBtnValue:) name:@"noti"
                                               object:nil];
}

#pragma mark 页面已经显示
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"B已经显示");
}

#pragma mark 页面即将消失
- (void)viewWillDisappear:(BOOL)animated
{
    //清空相应的按钮数据变量
    _blcokCallBack = nil;
    delegateValue = @"";
    userValue = @"";
    notiValue = @"";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"" forKey:@"userPassValue"];
    //清空按钮数据
    [_blockBtn setTitle:@"" forState:UIControlStateNormal];
    [_delegateBtn setTitle:@"" forState:UIControlStateNormal];
    [_userDefaultsBtn setTitle:@"" forState:UIControlStateNormal];
    [_notificationBtn setTitle:@"" forState:UIControlStateNormal];
    NSLog(@"B即将消失");
}
#pragma mark 页面已经消失
- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"B已经消失");
}

#pragma mark block传值方法
- (void)setBlockBtnValue:(NSString *(^)()) blockBack
{
    //判断block是否为空
    if(blockBack)
    {
        _blcokCallBack = blockBack;
    }
}

#pragma mark delegate传值方法
- (void)passValueWithDelegate:(NSString *)value
{
    delegateValue = value;
}

#pragma mark 通知传值方法
- (void)getNotificationBtnValue:(NSNotification *)noti
{
    notiValue = noti.object;
}

#pragma mark  - 返回按钮初始化
- (void)initWithShowValueButton
{
    
#pragma mark block返回按钮
    _blockBtn = [[UIButton alloc]initWithFrame:(CGRect){100,100,150,20}];

    [_blockBtn setBackgroundColor:[UIColor blackColor]];
    [_blockBtn setTitle:@"" forState:UIControlStateNormal];
    [_blockBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_blockBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    _blockBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _blockBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_blockBtn addTarget:self action:@selector(dismissBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_blockBtn];
    
#pragma mark delegate返回按钮
    _delegateBtn = [[UIButton alloc]initWithFrame:(CGRect){100,_blockBtn.frame.origin.y + _blockBtn.frame.size.height+10,150,20}];
    [_delegateBtn setTitle:@"" forState:UIControlStateNormal];
    [_delegateBtn setBackgroundColor:[UIColor blackColor]];
    [_delegateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_delegateBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    _delegateBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _delegateBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_delegateBtn addTarget:self action:@selector(dismissBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_delegateBtn];
    
#pragma mark NSUserDefaults返回按钮
    _userDefaultsBtn = [[UIButton alloc]initWithFrame:(CGRect){100,_delegateBtn.frame.origin.y + _delegateBtn.frame.size.height+10,150,20}];
    [_userDefaultsBtn setTitle:@"" forState:UIControlStateNormal];
    [_userDefaultsBtn setBackgroundColor:[UIColor blackColor]];
    [_userDefaultsBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_userDefaultsBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    _userDefaultsBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _userDefaultsBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_userDefaultsBtn addTarget:self action:@selector(dismissBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_userDefaultsBtn];
    
#pragma mark 通知传值按钮
    _notificationBtn = [[UIButton alloc]initWithFrame:(CGRect){100,_userDefaultsBtn.frame.origin.y + _userDefaultsBtn.frame.size.height+10,150,20}];
    [_notificationBtn setBackgroundColor:[UIColor blackColor]];
    [_notificationBtn setTitle:@"" forState:UIControlStateNormal];
    [_notificationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_notificationBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    _notificationBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _notificationBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_notificationBtn addTarget:self action:@selector(dismissBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_notificationBtn];
    
}

#pragma mark - 返回按钮点击事件
- (void)dismissBtnAction:(id)sender
{
    //获取按钮点击对象
    UIButton *btn = (UIButton *)sender;
    //显示当前点击按钮的名称
    NSLog(@"%@点击了",btn.titleLabel.text);
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"SecondView页面被销毁");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
