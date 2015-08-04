//
//  JHAppView.m
//  AppManagement
//
//  Created by jh on 15/8/5.
//  Copyright © 2015年 jh. All rights reserved.
//

#import "JHAppView.h"
#import "JHApp.h"

@interface JHAppView()

@property (weak, nonatomic)IBOutlet UIImageView *iconView;

@property (weak, nonatomic)IBOutlet UILabel *nameLabel;

@end

@implementation JHAppView

+ (instancetype)appView
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *objs = [bundle loadNibNamed:@"JHAppView" owner:nil options:nil];
    
    return [objs lastObject];
}

+ (instancetype)appViewWithApp:(JHApp *)app
{
    JHAppView *appView = [self appView];
    appView.app = app;
    return appView;

}
- (void)setApp:(JHApp *)app
{
    _app = app;
    
    //设置图标
    self.iconView.image = [UIImage imageNamed:app.icon];
    //设置名称
    self.nameLabel.text = app.name;

}
@end
