//
//  UserInfo.m
//  2016.5.11.NavigationWithLoginTest
//
//  Created by whunf on 16/5/11.
//  Copyright © 2016年 xinyanyuan. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

#pragma mark - 单例模式设计
#pragma mark 静态变量
static UserInfo *userInfo = nil;

#pragma mark  自定义构造函数
- (id)initWithUserName:(NSString *)username AndPassWord:(NSString *)password
{
    //判断静态变量是否为空
    if(userInfo==nil)
    {
        //新建实例
        userInfo = [[UserInfo alloc]init];
    }
    self.username = username;
    self.password = password;
    return userInfo;
}

#pragma mark 重写allocWithZone
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if(userInfo==nil)
    {
        userInfo = [super allocWithZone:zone];
    }
    return userInfo;
}

#pragma mark 实现copyWithZone
- (id)copyWithZone:(NSZone *)zone
{
    return userInfo;
}

#pragma mark - 归档和解档
#pragma mark 归档
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.password forKey:@"password"];
}

#pragma mark 解档
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(userInfo==nil)
    {
        userInfo = [[UserInfo alloc]init];
    }
    self.username = [aDecoder decodeObjectForKey:@"username"];
    self.password = [aDecoder decodeObjectForKey:@"password"];
    return userInfo;
}

@end
