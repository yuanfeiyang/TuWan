//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "YXTableViewController.h"
#import "YXPageViewController.h"

#import "UMMobClick/MobClick.h"



@interface AppDelegate ()
/** <#属性描述#> */
//@property (nonatomic) YXTableViewController *yxtableVC;
/** <#属性描述#> */
@property (nonatomic) YXPageViewController *pageVC;
/** <#属性描述#> */
@property (nonatomic) UINavigationController *navc;
@end

@implementation AppDelegate
- (UINavigationController *)navc{
    if (!_navc) {
        _navc = [[UINavigationController alloc]initWithRootViewController:self.pageVC];
    }
    return _navc;

}
- (YXPageViewController *)pageVC{
    if (!_pageVC) {
        _pageVC = [YXPageViewController new];
        _pageVC.showOnNavigationBar = YES;
        _pageVC.menuViewStyle = WMMenuViewStyleLine;
        _pageVC.menuBGColor = [UIColor clearColor];
        
    }
    return _pageVC;

}
//- (YXTableViewController *)yxtableVC{
//    if (!_yxtableVC) {
//        _yxtableVC = [[YXTableViewController alloc]initWithStyle:UITableViewStylePlain];
//    }
//    return _yxtableVC;
//
//}
- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor whiteColor];
        [_window makeKeyAndVisible];
        _window.rootViewController = self.navc;
    }
    return _window;

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UMConfigInstance.appKey = kUMengAppKey;
    UMConfigInstance.channelId = @"App Store";
    UMConfigInstance.eSType = E_UM_GAME; // 仅适用于游戏场景，应用统计不用设置
    
    [MobClick startWithConfigure:UMConfigInstance];

    
    
    //全局默认配置
    [self setupGlobalConfig];
    [self window];
    NSString *path = @"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1";
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [NSObject GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        DDLogError(@"%@",error);
    }];
    return YES;
}

@end
