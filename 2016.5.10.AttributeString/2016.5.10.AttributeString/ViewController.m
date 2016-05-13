//
//  ViewController.m
//  2016.5.10.AttributeString
//
//  Created by whunf on 16/5/10.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *_lblFirst;
    UILabel *_lblSecond;
    UILabel *_lblThird;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initWithLabel];
}

#pragma mark 标签初始化
- (void)initWithLabel
{
    //iOS中的富文本开发
    NSString *singleString = @"我是富文本";
    //创建一个NSMutableAttributedString对象
    NSMutableAttributedString *attributed = [[NSMutableAttributedString  alloc]initWithString:singleString];
   
    //添加下划线
    [attributed addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:NSMakeRange(0, singleString.length)];
    //设置文本的字体和大小
     //设置笔画的粗细
//    [attributed addAttribute:NSStrokeWidthAttributeName
//                       value:[NSNumber numberWithInt:NSUnderlineStyleDouble]
//                       range:NSMakeRange(0, singleString.length)];
    
    //设置标签的背景颜色
    [attributed addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(0, singleString.length)];
    
    //文本颜色 - 也会影响删除线和下划线
    [attributed addAttribute:NSStrokeColorAttributeName value:[UIColor blackColor] range:(NSRange){0,attributed.length}];
    //单独设置下划线和文本颜色
    //NSStrokeWidthAttributeName配合
    //NSForegroundColorAttributeName可以单独设置线条颜色
    [attributed addAttribute:NSForegroundColorAttributeName
                       value:[UIColor redColor]
                       range:NSMakeRange(0, singleString.length)];
    [attributed addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleDouble] range:(NSRange){0,attributed.length}];
    
    _lblFirst = [[UILabel alloc]initWithFrame:(CGRect){100,100,120,20}];
    _lblFirst.text = singleString;
    _lblFirst.textColor = [UIColor redColor];
    //设置标签的富文本设置
    _lblFirst.attributedText = attributed;
    [self.view addSubview:_lblFirst];
    
    
    NSString *secondStr = @"大江东去";
    NSMutableAttributedString *secondAtt = [[NSMutableAttributedString alloc]initWithString:secondStr];
    //添加删除线
    //Attribute:属性名称
    //value:属性对象的值 例如 线条对象NSNumber,字体对象UIFont
    //range:样式范围
    [secondAtt addAttribute:NSStrikethroughStyleAttributeName
                       value:[NSNumber numberWithInt:NSUnderlineStyleSingle]
                       range:NSMakeRange(0, secondStr.length)];
    
    _lblSecond = [[UILabel alloc]initWithFrame:(CGRect){100,_lblFirst.frame.origin.y+_lblFirst.frame.size.height+5,120,20}];
    _lblSecond.text = secondStr;
    _lblSecond.textColor = [UIColor redColor];
    _lblSecond.attributedText = secondAtt;
    [self.view addSubview:_lblSecond];
    
    NSString *third = @"comeonbabydsfasggfgsdfgsdfgdgdg";
    NSMutableAttributedString *thirdAtt =
     [[NSMutableAttributedString alloc]initWithString:third];
    
    //笔画的阴影
    NSShadow *shadow = [[NSShadow alloc]init];
    [shadow setShadowColor:[UIColor redColor]];
    //模糊度
    [shadow setShadowBlurRadius:5.0];
    //阴影偏移
    [shadow setShadowOffset:(CGSize){2,2}];

    //设置内容的阴影
    [thirdAtt addAttribute:NSShadowAttributeName value:shadow range:(NSRange){0,third.length}];
    [thirdAtt addAttribute:NSVerticalGlyphFormAttributeName value:@(1)range:(NSRange){0,third.length}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    //段落显示
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    //行间距
    [paragraphStyle setLineSpacing:1.0f];
    //字间距
    [paragraphStyle setParagraphSpacing:2.0f];
    [thirdAtt addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:(NSRange){0,third.length}];
    
    _lblThird = [[UILabel alloc]initWithFrame:(CGRect){100,_lblSecond.frame.origin.y+_lblSecond.frame.size.height+5,10,500}];
    _lblThird.text = third;
    //设为0可以多行显示
    _lblThird.numberOfLines = 0;
    _lblThird.textColor = [UIColor redColor];
    _lblThird.backgroundColor = [UIColor clearColor];
    _lblThird.attributedText = thirdAtt;
    [self.view addSubview:_lblThird];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
