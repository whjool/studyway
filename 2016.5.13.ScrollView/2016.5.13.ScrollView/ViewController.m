//
//  ViewController.m
//  2016.5.13.ScrollView
//
//  Created by whunf on 16/5/13.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"
#define mainFrame self.view.frame
#define mainSize self.view.frame.size
#define mainOrigin self.view.frame.origin
@interface ViewController ()
{
    UIScrollView *_scrollView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithScrollView];
}

#pragma mark 滚动视图初始化
- (void)initWithScrollView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:mainFrame];
    //弹簧效果
    _scrollView.bounces = YES;
    //滑动条
    //垂直滑动条
    _scrollView.showsVerticalScrollIndicator = YES;
    //水平滑动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    //额外的视图范围 (上，左，下，右)
//    _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 20, 20);
    int originX = 0;
    NSArray *images = [NSArray arrayWithObjects:@"image0",@"image1",@"image2",@"image3", nil];
    for (int i = 0; i<4; i++) {
        UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:images[i]]];
        //设置图片视图的frame
        imgView.frame = CGRectMake(originX, 0, mainSize.width, mainSize.height);
        //图片模式
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [_scrollView addSubview:imgView];
        //改变图片视图的坐标
        originX+=imgView.bounds.size.width;
    }
    //滚动视图的内容范围
    _scrollView.contentSize = CGSizeMake(images.count*mainSize.width, mainSize.height);
    // 是否可以进行画面切换
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
