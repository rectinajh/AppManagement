//
//  JHAppView.h
//  AppManagement
//
//  Created by jh on 15/8/5.
//  Copyright © 2015年 jh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHApp;
@interface JHAppView : UIView

//模型数据
@property (nonatomic, strong) JHApp  *app;

+ (instancetype)appView;

+ (instancetype)appViewWithApp:(JHApp*)app;
@end
