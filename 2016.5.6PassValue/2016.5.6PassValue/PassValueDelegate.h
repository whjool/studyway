//
//  PassValueDelegate.h
//  2016.5.6PassValue
//
//  Created by whunf on 16/5/6.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PassValueDelegate <NSObject>
//传值方法
- (void)passValueWithDelegate:(NSString *)value;

@end
