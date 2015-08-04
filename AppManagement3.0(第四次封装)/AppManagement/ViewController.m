//
//  ViewController.m
//  AppManagement
//
//  Created by jh on 15/8/4.
//  Copyright (c) 2015年 jh. All rights reserved.
//

#import "ViewController.h"
#import "JHApp.h"
#import "JHAppView.h"

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
    //列号
    int Columns = 3;
    
    
    //间距(控制器view的宽度 － 3 ＊应用宽度) / 4
    CGFloat marginX = (self.view.frame.size.width - Columns * appW) / (Columns + 1);
    CGFloat marginY = 20;
    //添加一个uiview
    for (int index = 0; index < self.apps.count; index ++) {
    
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *objs = [bundle loadNibNamed:@"JHAppView" owner:nil options:nil];
        
        JHAppView *appView = [objs lastObject];
        
        //添加view
        [self.view addSubview:appView];
        
        //计算位置,行号
        int row = index / Columns;
        int col = index % Columns;
        
        CGFloat appX = marginX + col * (appW + marginX);
        CGFloat appY = 30 + row * (appH + marginY);
        appView.frame = CGRectMake(appX, appY, appW, appH);
        
        // 设置数据
        JHApp *app = self.apps[index];
        
        //设置图标
        appView.iconView.image = [UIImage imageNamed:app.icon];
        //设置名称
        appView.nameLabel.text = app.name;
        
        
        
        
//        //设置数据
//        JHApp *app = self.apps[index];
//        //图片
//        UIImageView *iconView = appView.subviews[0];
//        UIImageView *iconView = (UIImageView *)[appView viewWithTag:10];
//        iconView.image =[UIImage imageNamed:app.icon];
//        
//        //名称
//        UILabel *nameLabel = appView.subviews[1];
//        UILabel *nameLabel = (UILabel *)[appView viewWithTag:20];
//        nameLabel.text = app.name;
    
    }
    
    
    
}

- (NSArray *)apps
{
    if (_apps == nil) {
        //初始化，获取plist 的全路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"app" ofType:@"plist"];
        //加载数组
        NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
        
        //将dicArray里面的所有字典转换成模型对象，放到新的数组中
        NSMutableArray *appArray = [NSMutableArray array];
        
        for (NSDictionary *dic in dicArray) {
            //创建模型对象
//            JHApp *app = [[JHApp alloc]init];
//            JHApp *app = [[JHApp alloc]initWithDict:dic];
            
            JHApp *app = [JHApp appWithDict:dic];

//            
//            [NSArray arrayWithContentsOfFile:<#(NSString *)#>];
//            
//            [[NSArray alloc]initWithContentsOfFile:];
            //将字典的所有属性赋值给模型
//            app.name = dic[@"name"];
//            app.icon = dic[@"icon"];
            
            //添加模型对象到数组中
            [appArray addObject:app];
        }
        //赋值
        _apps = appArray;
//        NSLog(@"%@",_apps);
    }
    return _apps;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
