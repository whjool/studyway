//
//  ViewController.m
//  2016.5.12.UISegmentedTest
//
//  Created by whunf on 16/5/12.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"
#define selectedWidth 80
@interface ViewController ()
{
    UISegmentedControl *seg;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithSegment];
    
    //将分段控件放入到导航中
    self.navigationItem.titleView = seg;
    //分段控件的渲染色彩
    seg.tintColor = [UIColor blackColor];
    //获取分段的标题
    NSString *indexStr = [seg titleForSegmentAtIndex:0];
    NSLog(@"%@",indexStr);
    //默认选中索引
    seg.selectedSegmentIndex = 0;
    //删除选项
    [seg removeSegmentAtIndex:1 animated:NO];
    //删除事件
//    [seg removeTarget:self action:@selector(segMentAction:) forControlEvents:UIControlEventValueChanged];
    
}

#pragma mark 分段控件初始化
- (void)initWithSegment
{
    //分段控件
#pragma mark 文字形式分段控件
    //以数组的数据初始化分段控件的每一项的值
     seg = [[UISegmentedControl alloc]initWithItems:@[@"red",@"green",@"cyan"]];
    //设置frame
    seg.frame = CGRectMake(120, 100, 120, 30);
    
    //为分段控件添加事件 - 值被修改的时候触发事件
    [seg addTarget:self action:@selector(segMentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:seg];
    
#pragma mark 图片形式分段控件
    UISegmentedControl *segImg = [[UISegmentedControl alloc]init];
    //设置frame
    segImg.frame = CGRectMake(120, seg.frame.size.height+110, 70, 30);
    //在索引处插入图片
    [segImg insertSegmentWithImage:[UIImage imageNamed:@"left"] atIndex:0 animated:NO];
    [segImg insertSegmentWithImage:[UIImage imageNamed:@"right"] atIndex:1 animated:NO];
    //瞬时单击
    segImg.momentary = YES; //瞬间单击后很快会恢复
    //    //在索引处插入文字
    //    [segImg insertSegmentWithTitle:@"left" atIndex:0 animated:NO];
    //    [segImg insertSegmentWithTitle:@"right" atIndex:1 animated:NO];
    //    //如果已经存在选项的情况下，设置对应索引的图片
    //    [segImg setImage:[UIImage imageNamed:@"left"] forSegmentAtIndex:0];
    //    [segImg setImage:[UIImage imageNamed:@"right"] forSegmentAtIndex:1];
    //为分段控件添加事件 - 值被修改的时候触发事件
    [segImg addTarget:self action:@selector(segImgAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segImg];
#pragma mark 分段控件详细属性
    UISegmentedControl *segView = [[UISegmentedControl alloc]init];
    //设置控件的frame
    CGRect rect = seg.frame;
    rect.origin.y +=segImg.frame.size.height+seg.frame.size.height+20;
    segView.frame = rect;
    //将文字插入到分段控件中
    [segView insertSegmentWithTitle:@"one" atIndex:0 animated:YES];
    [segView insertSegmentWithTitle:@"two" atIndex:1 animated:YES];
    [segView insertSegmentWithTitle:@"three" atIndex:2 animated:YES];
    //设置片段的宽度
    [segView setWidth:selectedWidth forSegmentAtIndex:0];
    //添加事件
    [segView addTarget:self action:@selector(segViewAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segView];
}

#pragma mark 文字形式分段控件点击事件
- (void)segMentAction:(id)sender
{
    UISegmentedControl *seg = sender;
    //获取当前选项卡的索引
    switch (seg.selectedSegmentIndex) {
        case 0: //当点击第一个选项
            [self.view setBackgroundColor:[UIColor redColor]];
            break;
        case 1://当点击第二个选项
            [self.view setBackgroundColor:[UIColor greenColor]];
            break;
        case 2://当点击第三个选项
            [self.view setBackgroundColor:[UIColor cyanColor]];
            break;
        default:
            break;
    }
}

#pragma mark 图片形式点击事件
- (void)segImgAction:(id)sender
{
    UISegmentedControl *seg = sender;
    CGRect rect = seg.frame;
    switch (seg.selectedSegmentIndex) {
        case 0:
            rect.origin.x-=10;
            break;
        case 1:
            rect.origin.x+=10;
            break;
        default:
            break;
    }
    seg.frame = rect;
}

#pragma mark 详细选项卡点击事件
- (void)segViewAction:(id)sender
{
    UISegmentedControl *seg = sender;
    switch (seg.selectedSegmentIndex) {
        case 0:
            [seg setWidth:selectedWidth forSegmentAtIndex:0];
            [seg setWidth:(seg.frame.size.width-selectedWidth)/2 forSegmentAtIndex:1];
            [seg setWidth:(seg.frame.size.width-selectedWidth)/2 forSegmentAtIndex:2];
            break;
        case 1:
            
            [seg setWidth:(seg.frame.size.width-selectedWidth)/2 forSegmentAtIndex:0];
            [seg setWidth:selectedWidth forSegmentAtIndex:1];
            [seg setWidth:(seg.frame.size.width-selectedWidth)/2 forSegmentAtIndex:2];
            break;
        case 2:
           [seg setWidth:(seg.frame.size.width-selectedWidth)/2 forSegmentAtIndex:0];
            [seg setWidth:(seg.frame.size.width-selectedWidth)/2 forSegmentAtIndex:1];
            [seg setWidth:selectedWidth forSegmentAtIndex:2];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
