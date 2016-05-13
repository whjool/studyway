//
//  RootViewController.m
//  2016.5.13.ScrollViewWithSegment
//
//  Created by whunf on 16/5/13.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "RootViewController.h"
#define selfSize self.view.frame.size
#define selfOrigin self.view.frame.origin
#define selfFrame self.view.frame

@interface RootViewController ()
{
    UIScrollView *_imageScrollView;
    UIScrollView *_segmentScrollView;
    UISegmentedControl *_segmentCTL;
    NSArray *images;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化分段滚动视图
    _segmentScrollView = [[UIScrollView alloc]initWithFrame:(CGRect){0,20,selfSize.width,30}];
    //初始化图片滚动视图
    _imageScrollView = [[UIScrollView alloc]initWithFrame:(CGRect){0,55,selfSize.width,selfSize.height-55}];
    //隐藏滑动条
    _imageScrollView.showsVerticalScrollIndicator = NO;
    _imageScrollView.showsHorizontalScrollIndicator = NO;
    _imageScrollView.delegate = self;
    //设置可以切换视图
    _imageScrollView.pagingEnabled = YES;
    //初始化图片
    images = [[NSArray alloc]init];
    //加载视图初始化
    [self initWithSegmentCTL];
    [self initWithImageView];
    //将滚动视图添加到主视图中
    [self.view addSubview:_segmentScrollView];
    [self.view addSubview:_imageScrollView];
}

#pragma mark 初始化分段控制
- (void)initWithSegmentCTL
{
    _segmentCTL = [[UISegmentedControl alloc]initWithItems:@[@"one",@"two",@"three",@"four",@"five",@"six",@"seven",@"eight"]];
    _segmentCTL.frame = CGRectMake(0, 0, 500, 30);
    //设置分段控制器默认选中状态
    [_segmentCTL setSelectedSegmentIndex:0];
    //给分段控件添加事件 - 值变换时触发
    [_segmentCTL addTarget:self action:@selector(segMentedAction:) forControlEvents:UIControlEventValueChanged];
    //隐藏滑动条
    _segmentScrollView.showsHorizontalScrollIndicator = NO;
    _segmentScrollView.showsVerticalScrollIndicator = NO;
    _segmentScrollView.contentSize = CGSizeMake(_segmentCTL.frame.size.width, 30);
    //将分段控制器放入到分段滚动视图中
    [_segmentScrollView addSubview:_segmentCTL];
}


#pragma mark 初始化图片视图
- (void)initWithImageView
{
    int originX = 0;
    for (int i = 0; i<8; i++) {
        //将图片放入到数组中
        images = [images arrayByAddingObject:
                  [UIImage imageNamed:
                    [NSString stringWithFormat:@"image%d",i]]];
        //创建图片视图
        UIImageView *imgView = [[UIImageView alloc]initWithImage:images[i]];
        //设置图片的frame
        imgView.frame = CGRectMake(originX, 0, selfSize.width, _imageScrollView.frame.size.height);
        [_imageScrollView addSubview:imgView];
        originX+=imgView.frame.size.width;
    }
    //图片滚动视图的内容范围
    _imageScrollView.contentSize = CGSizeMake(images.count*selfSize.width, _imageScrollView.frame.size.height);
}

#pragma mark - 事件

#pragma mark 分段控件事件 
- (void)segMentedAction:(id)sender
{
    UISegmentedControl *seg = sender;
    //获取当前分段控件的选项按钮
    NSInteger index = seg.selectedSegmentIndex;
    //设置偏移位置
    CGRect rect = _imageScrollView.frame;
    rect.origin.x = _imageScrollView.frame.size.width*index;
    rect.origin.y = 0;
    [_imageScrollView setContentOffset:rect.origin animated:YES];
    if (index>2) {
        [_segmentScrollView setContentOffset:(CGPoint){selfSize.width/2,0} animated:YES];
    }
    else
        [_segmentScrollView setContentOffset:(CGPoint){0,0} animated:YES];
}

#pragma mark - 滚动视图代理
#pragma mark 滚动时触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = _imageScrollView.contentOffset.x/selfSize.width;
    //设置分段控制器的当前选项
    [_segmentCTL setSelectedSegmentIndex:index];
    if(index>5)
    {
        //向后移动
        [_segmentScrollView setContentOffset:(CGPoint){selfSize.width/2,0} animated:YES];
    }else
        //向前移动
        [_segmentScrollView setContentOffset:(CGPoint){0,0} animated:YES];

}

#pragma mark 开始拖拽触发
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{

}

#pragma mark 完成拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

   
}

#pragma mark 开始减速时
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{

}

#pragma mark  减速停止的时候执行，触发时执行
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

}

#pragma mark 滚动动画停止时执行
//也就是setContentOffset改变时
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{

}

#pragma mark  设置放大缩小时
//必须是UIScrollView的子视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return nil;
}

#pragma mark 点击状态栏，自动回到顶部
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"1");
    return YES;
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
