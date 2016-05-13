//
//  ViewController.m
//  2016.5.13.UIScrollViewBanner
//
//  Created by whunf on 16/5/13.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"
#define objSize frame.size
#define objOrigin frame.origin
#define imageHeight 150
#define marginTop 20

@interface ViewController ()
{
    UIScrollView *_bannerScrollView;
    UIPageControl *_pageCTL;
    NSArray *images;
    NSTimer *timer;
    NSInteger page;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    page = 0;
    //初始化图片
    [self initWithBannerImage];
    //初始化滚动视图
    [self initWithScrollView];
    [self initWithPageCTL];
    //启动计时器
    [self startTimer];
}


#pragma mark - 初始化方法
- (void)initWithPageCTL
{
    _pageCTL = [[UIPageControl alloc]init];
    //设置页面控件的总页数
    _pageCTL.numberOfPages = images.count;
    //设置页面控件的x值
    int x = _bannerScrollView.objSize.width/2-_pageCTL.objSize.width/2;
    int y = _bannerScrollView.objSize.height-_pageCTL.objSize.height-5;
    CGRect rect = _pageCTL.frame;
    rect.origin.x = x;
    rect.origin.y = y;
    _pageCTL.frame = rect;
    [self.view addSubview:_pageCTL];
}

#pragma mark 初始化图片
- (void)initWithBannerImage
{
    images = [[NSArray alloc]init];
    for (int i = 0; i<4; i++) {
        //加载图片
        UIImage *image = [self loadImageWithName:[NSString stringWithFormat:@"banner%d",i] AndType:@"jpg"];
        //将图片放入到数组当中
        images = [images arrayByAddingObject:image];
    }
    
//    UIImage *image = [self loadImageWithName:@"banner0" AndType:@"jpg"];
//    images = [images arrayByAddingObject:image];
}

#pragma mark 初始化滚动视图
- (void)initWithScrollView
{
    _bannerScrollView = [[UIScrollView alloc]initWithFrame:(CGRect){0,marginTop,self.view.objSize.width,imageHeight}];
    NSInteger originX = 0;
    for (int i =0; i<images.count; i++) {
        UIImageView *imgView = [[UIImageView alloc]initWithImage:images[i]];
        //设置图片的frame
        imgView.frame = CGRectMake(originX, 0, self.view.objSize.width, imageHeight);
        //改变下一张图片的x值
        originX+=imgView.objSize.width;
        //将图片视图放入到滚动视图中
        [_bannerScrollView addSubview:imgView];
    }
    _bannerScrollView.delegate = self;
    //隐藏水平和垂直滑动条
    _bannerScrollView.showsVerticalScrollIndicator = NO;
    _bannerScrollView.showsHorizontalScrollIndicator = NO;
    //设置为分页模式
    _bannerScrollView.pagingEnabled = YES;
    //设置滚动视图内容大小
    _bannerScrollView.contentSize = CGSizeMake(self.view.objSize.width*images.count, imageHeight);
    [self.view addSubview:_bannerScrollView];
}

#pragma mark - 功能性方法

#pragma mark 启动计时器
- (void)startTimer
{
    timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(Viwepager) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

#pragma mark 关闭计时器
- (void)stopTimer
{
    [timer invalidate];
    timer = nil;
}

#pragma mark 加载图片
- (UIImage *)loadImageWithName:(NSString *)imgName AndType:(NSString *)imgType
{
    //根据路径寻找
    NSString *path = [[NSBundle mainBundle] pathForResource:imgName ofType:imgType];
    
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    //返回图片对象
    return image;
}

#pragma mark 图片轮播
- (void)Viwepager
{
    if(page<images.count)
    //移动显示广告的滚动视图
    [_bannerScrollView setContentOffset:(CGPoint){_bannerScrollView.objSize.width*page,0} animated:YES];
    else
    {
        page = 0;
        [_bannerScrollView setContentOffset:(CGPoint){_bannerScrollView.objSize.width*page,0} animated:NO];
    }
    //设置页面控件的页数
    _pageCTL.currentPage = page;
    //页数增加
    page++;

}

#pragma mark 设置滚动视图和页面控件的位置
- (void)setPageIndex
{
    int index = _bannerScrollView.contentOffset.x/_bannerScrollView.objSize.width;
    page = index;
    _pageCTL.currentPage = page;
}

#pragma mark - 滚动视图代理方法
#pragma mark 当用户准备拖拽的时候，关闭定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

#pragma mark 当用户停止拖拽的时候，添加一个定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //重新设置
    [self setPageIndex];
    [self startTimer];
}

//#pragma mark 当用户触摸时触发
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    [self stopTimer];
//    
//}

#pragma mark 当用户拖拽的时候，改变页面控制器的圆点位置
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    //重新设置
//     [self setPageIndex];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
