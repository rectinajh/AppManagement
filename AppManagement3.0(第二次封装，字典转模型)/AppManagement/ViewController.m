//
//  ViewController.m
//  AppManagement
//
//  Created by jh on 15/8/4.
//  Copyright (c) 2015年 jh. All rights reserved.
//

#import "ViewController.h"
#import "JHApp.h"
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
    
        UIView *appView = [[UIView alloc]init];
        
        //计算位置,行号
        int row = index / Columns;
        int col = index % Columns;
        
        CGFloat appX = marginX + col * (appW + marginX);
        CGFloat appY = 30 + row * (appH + marginY);
        appView.frame = CGRectMake(appX, appY, appW, appH);
        [self.view addSubview:appView];
        
        
//        NSDictionary *appInfo = self.apps[index];
        JHApp *appInfo = self.apps[index];
        //添加内部的小控件
        //添加图片
        UIImageView *iconView = [[UIImageView alloc]init];
        CGFloat iconW = 45;
        CGFloat iconH = 45;
        CGFloat iconX = (appW - iconW) * 0.5;
        CGFloat iconY = 0;

        //contentMode可以使图片居中
//        iconView.image = [UIImage imageNamed:appInfo[@"icon"]];
        iconView.image = [UIImage imageNamed:appInfo.icon];
        iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
        [appView addSubview:iconView];
        
        //添加名字
        UILabel *nameLabel = [[UILabel alloc]init];
        CGFloat nameW = appW;
        CGFloat nameH = 20;
        CGFloat nameX = 0;
        CGFloat nameY = iconY + iconH;
//        nameLabel.text = appInfo[@"name"];
        nameLabel.text = appInfo.name;
        nameLabel.font = [UIFont systemFontOfSize:13];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
        nameLabel.backgroundColor = [UIColor whiteColor];
        [appView addSubview:nameLabel];
        
        //添加下载按钮
        UIButton *downloadBtn = [[UIButton alloc]init];
        CGFloat downX = 15;
        CGFloat downY = nameY + nameH;
        CGFloat downW = appW - 2 * downX;
        CGFloat downH = 20;
        
        UIImage *normalImage = [UIImage imageNamed:@"buttongreen"];
        [downloadBtn setBackgroundImage:normalImage forState:UIControlStateNormal];
        
        UIImage *highImage = [UIImage imageNamed:@"buttongreen_highlighted"];
        [downloadBtn setBackgroundImage:highImage forState:UIControlStateHighlighted];
        downloadBtn.frame = CGRectMake(downX, downY, downW, downH);
        //titlelabel也可以显示文字，但是不推荐直接拿到按钮内部的label的文字，按钮是有状态的
        [downloadBtn setTitle:@"下载" forState:UIControlStateNormal];
        downloadBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        downloadBtn.backgroundColor = [UIColor greenColor];
        [appView addSubview:downloadBtn];
        
        
        
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
