//
//  YXPageViewController.m
//  TRProject
//
//  Created by spare on 16/6/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXPageViewController.h"
#import "YXTableViewController.h"
@interface YXPageViewController ()

@end

@implementation YXPageViewController
- (NSArray<NSString *> *)titles{
    return @[@"头条",@"独家",@"暗黑",@"魔兽",@"风暴",@"炉石",@"星际",@"守望",@"图片",@"视频",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];

}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{

    return self.titles[index];
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    YXTableViewController *vc = [[YXTableViewController alloc]initWithStyle:UITableViewStylePlain dataListType:index];
    return vc;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
