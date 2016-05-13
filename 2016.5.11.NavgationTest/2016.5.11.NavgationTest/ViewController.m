//
//  ViewController.m
//  2016.5.11.NavgationTest
//
//  Created by whunf on 16/5/11.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()
{
    UIButton *_button;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.navigationController. childViewControllers);
    //1.navgationController会以栈的形式将视图控制器放入到导航栏中
    //2.跳转页面是进栈
    //3.返回页面是出栈
    //4.每个页面都会形成自己的navgationBar
    //5.设置导航栏的标题时，如果当前页面设置了titile,就会默认使用当前页面的titile,如果没有就需要设置navigationItem的title
    //6.出栈的页面会被销毁掉
    [self setTitle:@"第一个页面"];
    [self.view setBackgroundColor:[UIColor greenColor]];
//    self.navigationItem.title = @"第一个页面";
    [self initWithButton];
    
#pragma mark navigationBar设置
    //设置Bar背景色
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    //设置bar的前景色，包括左按钮和右按钮
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    //单独设置bar上面的title颜色
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    //
//    UIBarMetricsDefault,  //平铺
//    UIBarMetricsCompact,  //透明横屏样式
//    UIBarMetricsDefaultPrompt,
//    UIBarMetricsCompactPrompt,
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"btn"] forBarMetrics:UIBarMetricsDefault];
    
#pragma mark bar上方的按钮设置
    //右按钮
    //使用系统自带图标进行设置
//    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(rightBtnAction)];
    //使用文字进行设置
//    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"GO" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnAction)];
    //使用自定义图片设置按钮
    //图片的渲染模式
//    UIImageRenderingModeAutomatic,    //根据图片的使用环境和所处的绘图上下文自动调整渲染模式 默认选项
//    UIImageRenderingModeAlwaysOriginal,//始终绘制图片原始转台，不使用TintColor
//    UIImageRenderingModeAlwaysTemplate,//始终根据TineColor绘制图片，忽略图片的颜色信息
    //注意事项：图片的大小不能超过bar的大小
//    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithImage:
//                            [[UIImage imageNamed:@"btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnAction)];
    //使用UIView设置按钮
    UIButton *rBtn = [[UIButton alloc]initWithFrame:(CGRect){0,0,30,30}];
    [rBtn setImage:[UIImage imageNamed:@"btnNroml.jpg"] forState:UIControlStateNormal];
    [rBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithCustomView:rBtn];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
#pragma mark title设置
   //设置bar上面的titleView
//    //文字
//    UILabel *label = [[UILabel alloc]initWithFrame:(CGRect){0,0,50,20}];
//    label.text = @"hello world";
//    label.textColor = [UIColor whiteColor];
//    //图片
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:(CGRect){0,0,50,20}];
//    imageView.image = [UIImage imageNamed:@"btn"];
//    
//    self.navigationItem.titleView = label;
    
}



//右按钮事件
- (void)rightBtnAction
{
    NSLog(@"点击了右按钮");
    SecondViewController *secondView = [[SecondViewController alloc]init];
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
    SecondViewController *secondView = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:secondView animated:NO];
}

//- (void)dealloc
//{
//    NSLog(@"root销毁");
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
