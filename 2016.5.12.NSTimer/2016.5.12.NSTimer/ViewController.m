//
//  ViewController.m
//  2016.5.12.NSTimer
//
//  Created by whunf on 16/5/12.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *label;
    NSTimer *timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithLabel];
    //计时器
    //初始化   - 会自动将mode放入到runloop中执行,立即执行
    //TimeInterval:以秒为单位，多久会触发一次
    //target:载体 ,在哪个视图对象中执行
    //selector:触发时需要执行的方法，可以将自身的NSTimer对象作为参数传入
    //userInfo:参数
    //repeats:是否重复
//    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
//                                             target:self
//                                           selector:@selector(doAction:)
//                                           userInfo:@"j"
//                                            repeats:YES];
    
    //初始化
    //不会自动将mode放入到RunLoop中，需要手动添加
    timer = [NSTimer timerWithTimeInterval:0.01
                                    target:self
                                  selector:@selector(doAction:)
                                  userInfo:nil
                                   repeats:YES];
    
    //将计数器放入到runloop才会开始执行
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode ];
    
    //注意事项:
    //NSTimer可以精确到50-100毫秒
    //NSTimer不是绝对准确的，而且中间耗时或阻塞错过下一个点，那么下一个点就pass过去了.
    
}

- (void)initWithLabel
{
#pragma mark 标签初始化
    label = [[UILabel alloc]initWithFrame:(CGRect){0,0,100,100}];
    [label setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:label];
#pragma mark 按钮初始化
    UIButton *button = [[UIButton alloc]initWithFrame:(CGRect){100,100,120,30}];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(startTimerAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 1;
    [self.view addSubview:button];
    
}


- (void)startTimerAction:(id)sender
{
    UIButton *btn = sender;
    if (btn.tag) {
        btn.tag = 0;
        [btn setTitle:@"开始" forState:UIControlStateNormal];
        //暂停 - distantFuture 代表一个很遥远的时间
        //setFireDate 启动时间
        [timer setFireDate:[NSDate distantFuture]];
    }else
    {
        btn.tag = 1;
        [btn setTitle:@"停止" forState:UIControlStateNormal];
        //继续 - date 当前时间
        [timer setFireDate:[NSDate date]];
    }
}

- (void)doAction:(id)sender
{
//    NSTimer *tempTimer = sender;
    //读取传入的参数
//    NSLog(@"%@",[tempTimer userInfo]);
    CGRect rect = label.frame;
    rect.origin.y+=10;
    label.frame = rect;
    if(label.frame.origin.y>self.view.frame.size.height)
    {
        rect.origin.y = 0;
        label.frame = rect;
        //停止计时器
//        [timer invalidate];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
