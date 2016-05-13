//
//  ViewController.m
//  2016.5.12.PlantWithNSTimer
//
//  Created by whunf on 16/5/12.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "ViewController.h"
#define planeWidth   50
#define planeHeight 100
#define mainSize self.view.frame.size
#define mainOrigin self.view.frame.origin

@interface ViewController ()
{
    UIImageView *plane;
    UIImageView *enemyPlane;
    UIImageView *bullet;
    UIScrollView *mainScrollView;
    NSTimer *timer;
    NSArray *array;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithPlane];
    [self initWithEnemyPlane];
    //如果使用这种模式，控制别的控件的时候，会干扰到计时器
//    [NSTimer scheduledTimerWithTimeInterval:<#(NSTimeInterval)#> target:<#(nonnull id)#> selector:<#(nonnull SEL)#> userInfo:<#(nullable id)#> repeats:<#(BOOL)#>];
    
    
    //使用这种模式，不会产生冲突，
    timer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(sendBullet) userInfo:nil repeats:YES  ];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    array = [[NSArray alloc]init];
    
    for (int i = 1; i<=8; i++) {
        array = [array arrayByAddingObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]]];
    }
    
}


#pragma mark 初始化飞机
- (void)initWithPlane
{
    plane = [[UIImageView alloc]initWithFrame:(CGRect){mainSize.width/2-planeWidth/2,mainSize.height-planeHeight,planeWidth,planeHeight}];
    plane.image = [UIImage imageNamed:@"plane.jpg"];
    [self.view addSubview:plane];
    
    bullet = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"start"]];
    CGRect rect = plane.frame;
    rect.origin.x = plane.frame.origin.x+planeWidth/2+bullet.frame.size.width/2;
    rect.origin.y = mainSize.height-planeHeight-bullet.frame.size.height;
    rect.size.width = 20;
    rect.size.height = 20;
    bullet.frame = rect;
    bullet.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:bullet];
}

#pragma mark 初始化敌人飞机
- (void)initWithEnemyPlane
{
    enemyPlane = [[UIImageView alloc]initWithFrame:(CGRect){100,100,planeWidth,planeHeight}];
    enemyPlane.userInteractionEnabled = NO;
    enemyPlane.image = [UIImage imageNamed:@"plane.jpg"];
    [self.view addSubview:enemyPlane];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    [UIView animateWithDuration:0.5 animations:^{
        plane.center = point;
    }];
}



#pragma mark 子弹
- (void)sendBullet
{
    CGRect rect = bullet.frame;
    rect.origin.y -=50;
    bullet.frame = rect;
    if(bullet.frame.origin.y<0)
    {
        CGRect rect = plane.frame;
        rect.origin.x = plane.frame.origin.x+bullet.frame.size.width/2;
        rect.origin.y = plane.frame.origin.y;
        rect.size.width = 20;
        rect.size.height = 20;
        bullet.frame = rect;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
