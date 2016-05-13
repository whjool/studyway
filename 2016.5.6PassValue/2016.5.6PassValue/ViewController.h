//
//  ViewController.h
//  2016.5.6PassValue
//
//  Created by whunf on 16/5/6.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
@interface ViewController : UIViewController
@property (nonatomic,readwrite,weak)id<PassValueDelegate> delegate;
@end

