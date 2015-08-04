//
//  ViewController.m
//  AppManagement
//
//  Created by jh on 15/8/4.
//  Copyright (c) 2015年 jh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic ,strong) NSArray   *apps;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.apps;
    //添加应用信息
    CGFloat appW = 85;
    CGFloat appH = 90;
    
    //间距(控制器view的宽度 － 3 ＊应用宽度) / 4
    CGFloat margin = (self.view.frame.size.width - 3 * appW) / 4;
    

    //添加一个uiview
    UIView *appView = [[UIView alloc]init];
    appView.backgroundColor = [UIColor yellowColor];
    
    CGFloat appX = margin;
    CGFloat appY = 30;

    appView.frame = CGRectMake(appX, appY, appW, appH);
    [self.view addSubview:appView];
    
    //添加2个uiview
    UIView *appView2 = [[UIView alloc]init];
    appView2.backgroundColor = [UIColor blueColor];
    
    CGFloat appX2 = appX + appW +margin;
    CGFloat appY2 = 30;
    
    appView2.frame = CGRectMake(appX2, appY2, appW, appH);
    [self.view addSubview:appView2];
    
    //添加3个uiview
    UIView *appView3 = [[UIView alloc]init];
    appView3.backgroundColor = [UIColor greenColor];
    
    CGFloat appX3 = appX2 + appW + margin;
    CGFloat appY3 = 30;
    
    appView3.frame = CGRectMake(appX3, appY3, appW, appH);
    [self.view addSubview:appView3];
    
    //添加4个uiview
    UIView *appView4 = [[UIView alloc]init];
    appView4.backgroundColor = [UIColor grayColor];
    
    CGFloat appX4 = appX;
    CGFloat appY4 = appY + appH +30;
    
    appView4.frame = CGRectMake(appX4, appY4, appW, appH);
    [self.view addSubview:appView4];
    
}

- (NSArray *)apps
{
    if (_apps == nil) {
        //初始化，获取plist 的全路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"app" ofType:@"plist"];
        //加载数组
        _apps = [NSArray arrayWithContentsOfFile:path];
        
        NSLog(@"%@",_apps);
    }
    return _apps;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
