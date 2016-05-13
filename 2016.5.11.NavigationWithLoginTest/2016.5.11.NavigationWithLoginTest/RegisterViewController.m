//
//  RegisterViewController.m
//  2016.5.11.NavigationWithLoginTest
//
//  Created by whunf on 16/5/11.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "RegisterViewController.h"
#import "MyTools.h"
#import "UserInfo.h"
#define mainSize self.view.frame.size
#define mainOrigin self.view.frame.origin
#define marginLeft 100
#define textFieldWith 120
#define textFieldHeight 20

@interface RegisterViewController ()
{
#pragma mark - 控件属性定义
    UILabel *_lblAuther;       //账号标签
    UILabel *_lblPassWord;     //密码标签
    UITextField *_txtAuther;   //账号文本框
    UITextField *_txtPassWord; //密码文本框
    UIButton *_registerButton;     //注册按钮
        UILabel *_lblError;         //错误提示框
#pragma mark - 用户信息定义
    UserInfo *_userInfo;        //用户信息
}
@end

@implementation RegisterViewController

//页面即将消失的时候清空相关数据
- (void)viewWillDisappear:(BOOL)animated
{
    _txtAuther.text = @"";
    _txtPassWord.text = @"";
    _lblError.text = @"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //设置导航栏的颜色
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
    //设置导航栏的前景色
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    //设置当前页面navigationBar的标题
    self.navigationItem.title = @"注册页面";
    //设置当前的左按钮
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithTitle:@"登陆" style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnAction)];
    self.navigationItem.leftBarButtonItem = leftBtn;
#pragma mark 登录页面初始化调用
    [self initWithLoginView];
}
#pragma mark - 登陆页面初始化
- (void)initWithLoginView
{
#pragma mark 账号设置
    _lblAuther = [[UILabel alloc]init];
    _lblAuther.text = @"账号:";
    _lblAuther.textColor = [UIColor blackColor];
    [_lblAuther sizeToFit];
    CGRect rect = _lblAuther.frame;
    rect.origin.x = marginLeft;
    rect.origin.y = 100;
    _lblAuther.frame = rect;
    [self.view addSubview:_lblAuther];
    
    _txtAuther = [[UITextField alloc]init];
    CGFloat txtAutherX = _lblAuther.frame.origin.x+_lblAuther.frame.size.width+10;
    CGFloat txtAutherY = _lblAuther.frame.origin.y;
    _txtAuther.frame = CGRectMake(txtAutherX, txtAutherY, textFieldWith, textFieldHeight);
    _txtAuther.placeholder = @"请输入账号";
    _txtAuther.layer.borderWidth = 1;
    _txtAuther.layer.borderColor = [UIColor blackColor].CGColor;
    //设置文本框事件为结束输入时发生事件
    [_txtPassWord addTarget:self
                     action:@selector(textFieldAction)
           forControlEvents:UIControlEventEditingDidEnd];
    [self.view addSubview:_txtAuther];
#pragma mark 密码设置
    _lblPassWord = [[UILabel alloc]init];
    _lblPassWord.text = @"密码:";
    _lblPassWord.textColor = [UIColor blackColor];
    [_lblPassWord sizeToFit];
    rect = _lblAuther.frame;
    rect.origin.x = marginLeft;
    rect.origin.y = _lblAuther.frame.origin.y+_lblAuther.frame.size.height+10;
    _lblPassWord.frame = rect;
    [self.view addSubview:_lblPassWord];
    
    _txtPassWord = [[UITextField alloc]init];
    CGFloat txtPassWordX = _lblPassWord.frame.origin.x+_lblPassWord.frame.size.width+10;
    CGFloat txtPassWordY = _lblPassWord.frame.origin.y;
    _txtPassWord.frame = CGRectMake(txtPassWordX, txtPassWordY, textFieldWith, textFieldHeight);
    _txtPassWord.placeholder = @"请输入密码";
    //将文本框的内容显示改为密码模式
    _txtPassWord.secureTextEntry = YES;
    _txtPassWord.layer.borderWidth = 1;
    _txtPassWord.layer.borderColor = [UIColor blackColor].CGColor;
    //设置文本框事件为结束输入时发生事件
    [_txtPassWord addTarget:self
                     action:@selector(textFieldAction)
           forControlEvents:UIControlEventEditingDidEnd];
    [self.view addSubview:_txtPassWord];
#pragma mark 登陆按钮设置
    _registerButton = [[UIButton alloc]init];
    //设置按钮的Y值
    CGFloat loginBtnY = _lblPassWord.frame.origin.y+_lblPassWord.frame.size.height+10;
    //设置按钮的宽度
    CGFloat loginBtnWidth = _lblPassWord.frame.size.width+10+_txtPassWord.frame.size.width;
    //设置按钮的frame
    _registerButton.frame = CGRectMake(marginLeft, loginBtnY,loginBtnWidth , 30);
    //设置按钮正常状态下的标题
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    //设置按钮的背景色
    [_registerButton setBackgroundColor:[UIColor blackColor]];
    //设置按钮在正常状态的文字颜色
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置按钮在高亮状态下的背景色
    [_registerButton setBackgroundImage:[MyTools ChangeUIColorToUIImage:[UIColor redColor]] forState:UIControlStateHighlighted];
    //设置按钮的事件
    [_registerButton addTarget:self action:@selector(registerBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
#pragma mark 提示标签
    _lblError = [[UILabel alloc]init];
    CGFloat lblErrorY = _registerButton.frame.origin.y+_registerButton.frame.size.height+10;
    _lblError.frame = CGRectMake(marginLeft,lblErrorY,_registerButton.frame.size.width,20);
    //设置提示框的文本颜色为红色
    _lblError.textColor = [UIColor redColor];
    //设置提示框的文本对齐方式为居中
    _lblError.textAlignment = NSTextAlignmentCenter;
    //隐藏
    _lblError.hidden = YES;
    //设置提示框的字体大小为12
    _lblError.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:_lblError];
}

#pragma mark - 事件
#pragma mark 注册按钮点击事件
- (void)registerBtnAction
{
    NSString *txtUserName = _txtAuther.text;
    NSString *txtPassWord = _txtPassWord.text;
    if(txtUserName&&txtPassWord)
    {
        //创建用户信息
        _userInfo = [[UserInfo alloc]initWithUserName:txtUserName AndPassWord:txtPassWord];
        //构建沙盒路径
        NSString *path = NSHomeDirectory();
        path = [path stringByAppendingPathComponent:@"Documents/userInfo.plist"];
        //将用户信息归档至本地当中
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_userInfo];
        BOOL ret = [data writeToFile:path atomically:YES];
        _lblError.text =  ret?@"归档成功":@"归档失败";
        _lblError.hidden = NO;
    }
}
#pragma mark - 事件
#pragma mark 导航栏右按钮事件
- (void)leftBtnAction
{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark 文本框DidBegin事件
- (void)textFieldAction
{
    //将提示框隐藏
    _lblError.hidden = YES;
    //清空提示框内容
    _lblError.text = @"";
}

#pragma mark 触摸事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //注销文本框为第一响应者
    [_txtAuther resignFirstResponder];
    [_txtPassWord resignFirstResponder];
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
