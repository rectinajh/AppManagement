//
//  JHApp.h
//  AppManagement
//
//  Created by jh on 15/8/4.
//  Copyright © 2015年 jh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHApp : NSObject

//名称
@property (nonatomic, copy)NSString *name;

//图标
@property (nonatomic, copy)NSString *icon;

//通过字典来初始化模型对象
- (instancetype)initWithDict:(NSDictionary *)dict;


+ (instancetype)appWithDict:(NSDictionary *)dict;

@end
