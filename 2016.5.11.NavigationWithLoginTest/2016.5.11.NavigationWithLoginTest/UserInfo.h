//
//  UserInfo.h
//  2016.5.11.NavigationWithLoginTest
//
//  Created by whunf on 16/5/11.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject<NSCoding,NSCopying>
#pragma mark 用户名
@property (nonatomic,readwrite,copy)NSString *username;
#pragma mark 密码
@property (nonatomic,readwrite,copy)NSString *password;


/**
 *  实例构造函数
 *  初始化用户信息
 *  @param username 用户名
 *  @param password 密码
 *
 *  @return instance of UserInfo
 */
- (id)initWithUserName:(NSString *)username
                     AndPassWord:(NSString *)password;
@end
