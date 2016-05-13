//
//  SecondViewController.h
//  2016.5.6PassValue
//
//  Created by whunf on 16/5/6.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValueDelegate.h"
typedef  NSString *(^MyBlock)();
@interface SecondViewController : UIViewController<PassValueDelegate>
@property (nonatomic,copy)MyBlock blcokCallBack;
- (void)setBlockBtnValue:(MyBlock) blockBack;
- (void)addObserverNotification;
@end
