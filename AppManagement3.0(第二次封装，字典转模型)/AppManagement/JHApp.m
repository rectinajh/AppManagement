//
//  JHApp.m
//  AppManagement
//
//  Created by jh on 15/8/4.
//  Copyright © 2015年 jh. All rights reserved.
//

#import "JHApp.h"

@implementation JHApp

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (id)appWithDict:(NSDictionary *)dict
{
    //随调用，指向谁
    return [[self alloc]initWithDict:dict];;

}
@end
