//
//  ViewController.m
//  2016.margin.10.UITextView
//
//  Created by whunf on 16/5/10.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"
#define mainSize self.view.frame.size
#define mainOrigin self.view.frame.origin
#define minHeight 25        //文本框最小高度
#define maxHeight 100       //文本框最高高度
#define margin 5        //文本框相对父控件周边距离


@interface ViewController ()
{
    UITextView *_textView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    [self initWithTextView];

    NSNotificationCenter *noti = [NSNotificationCenter defaultCenter];
    
    //监听键盘弹起
    [noti addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardDidShowNotification object:nil];
    
    //监听键盘消失
    [noti addObserver:self selector:@selector(keyBoardHidden:) name:UIKeyboardDidHideNotification object:nil];
    
}

#pragma mark 初始化文本框
- (void)initWithTextView
{
    //UITextView - 多行文本视图
    _textView = [[UITextView alloc]initWithFrame:(CGRect){margin,mainSize.height-30,mainSize.width-10,minHeight}];
    //文本内容
    _textView.text = @"";
    //圆角
    _textView.layer.cornerRadius = 5;
    //是否可以编辑
    _textView.editable = YES;
    //字体大小和样式设置
    _textView.font = [UIFont fontWithName:@"Arial" size:14.0];
    //键盘return键类型
    _textView.returnKeyType = UIReturnKeyDefault;
    //键盘类型
    _textView.keyboardType = UIKeyboardTypeDefault;
    //文本对齐方式
//    _textView.textAlignment = NSTextAlignmentCenter;
    //文本框滑动条
    _textView.scrollEnabled = YES;
    //设置文本框代理
    _textView.delegate = self;
    [self.view addSubview:_textView];
    
    
//    UITextField *txtField = [[UITextField alloc]initWithFrame:(CGRect){maxHeight,220,maxHeight,20}];
//    txtField.placeholder = @"请输入";
//    [txtField setBackgroundColor:[UIColor whiteColor]];
//    //将视图插入到_textView的下面
//    [self.view insertSubview:txtField belowSubview:_textView];
//    //将视图插入到_textView的上面
//    [self.view insertSubview:txtField aboveSubview:_textView];
//    //将视图插入到第x位 0为最底层，依次向上
//    [self.view insertSubview:txtField atIndex:1];
//    
//    [self.view addSubview:txtField];
    
}

#pragma mark - 键盘监听事件
#pragma mark 键盘弹起
- (void)keyBoardShow:(NSNotification *)notification
{
    NSValue *keyBoard = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    //获取键盘数据
    CGRect keyBoardRect;
    [keyBoard getValue:&keyBoardRect];
    //设置文本框方位
    CGRect textViewFrame = _textView.frame;
    //设置文本框的方位 是 主视图的高度减去键盘的高度和控件的高度
    textViewFrame.origin.y = mainSize.height - keyBoardRect.size.height-_textView.frame.size.height-2;
    //重新设置文本框的rect
    _textView.frame = textViewFrame;
}


#pragma mark 键盘消失
- (void)keyBoardHidden:(NSNotification *)notification
{
    NSLog(@"键盘消失了");
    //如果文本框的内容小于最小范围，设置为相应的frame
    if(_textView.contentSize.height<minHeight)
        _textView.frame = (CGRect){margin,mainSize.height-30,mainSize.width-10,minHeight};
    //如果文本框的内容超过了最大值，设置为最大值
    else if(_textView.contentSize.height>=maxHeight)
        _textView.frame = (CGRect){margin,mainSize.height-maxHeight-margin,mainSize.width-10,maxHeight};
    else //如果文本框的内容在最小值和最大值之间，根据文本框的内容进行变化
        _textView.frame = (CGRect){margin,mainSize.height-_textView.contentSize.height-5,mainSize.width-10,_textView.contentSize.height};
}

#pragma mark 触摸事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //如果文本框的内容小于最小范围，设置为相应的frame
    if(_textView.contentSize.height<minHeight)
        _textView.frame = (CGRect){margin,mainSize.height-35,mainSize.width-10,minHeight};
    //如果文本框的内容超过了最大值，设置为最大值
    else if(_textView.contentSize.height>=maxHeight)
        _textView.frame = (CGRect){margin,mainSize.height-maxHeight-margin,mainSize.width-10,maxHeight};
    else //如果文本框的内容在最小值和最大值之间，根据文本框的内容进行变化
         _textView.frame = (CGRect){margin,mainSize.height-_textView.contentSize.height-margin,mainSize.width-10,_textView.contentSize.height};

    [_textView resignFirstResponder];
}

#pragma mark - 文本框代理
////开始编辑
//- (void)textViewDidBeginEditing:(UITextView *)textView
//{
//    NSLog(@"开始编辑了");
//}

//内容改变
- (void)textViewDidChange:(UITextView *)textView
{
//    NSLog(@"内容变了");
//    contentSize   //获取多行文本框内容大小
    if(textView.contentSize.height>minHeight&&textView.contentSize.height<maxHeight)
    {
        CGRect txtViewRect = textView.frame;
        //文本框在输入的时候，避免多余的内容被键盘遮挡，需要改变文本的方位
        txtViewRect.origin.y = textView.frame.origin.y-textView.contentSize.height+textView.frame.size.height;
       //文本框在输入的时候，避免多余的内容无法显示，需要改变文本的大小
        txtViewRect.size = textView.contentSize;
        textView.frame = txtViewRect;
    }
    
    
    //如果文本框的内容小于最小范围，设置为默认状态
    if(textView.contentSize.height<minHeight)
    {
        textView.frame =  (CGRect){margin,mainSize.height-30,mainSize.width-10,minHeight};
    }

}
//
////焦点发生改变
//- (void)textViewDidChangeSelection:(UITextView *)textView
//{
//    NSLog(@"焦点发生改变");
//}
//
////结束编辑
//- (void)textViewDidEndEditing:(UITextView *)textView
//{
//    NSLog(@"结束编辑");
//}
//
////即将开始编辑
//- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
//{
//    NSLog(@"即将开始编辑");
//    return YES;
//}
//
////即将结束编辑
//- (BOOL)textViewShouldEndEditing:(UITextView *)textView
//{
//    NSLog(@"即将结束编辑");
//    return YES;
//}
//
//// 内容将要发生改变编辑
//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
//{
//    NSLog(@"即将发生改变编辑");
//    return YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
