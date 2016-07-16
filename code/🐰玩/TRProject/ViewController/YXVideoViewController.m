//
//  YXVideoViewController.m
//  TRProject
//
//  Created by spare on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXVideoViewController.h"
@import MediaPlayer;


@interface YXVideoViewController ()
/** <#属性描述#> */
@property (nonatomic) YXVideoViewModel *videoModel;
@end

@implementation YXVideoViewController
- (YXVideoViewModel *)videoModel{
    if (!_videoModel) {
        _videoModel = [[YXVideoViewModel alloc]initWithAid:_aid];
    }
    return _videoModel;

}


//320 * 175
- (instancetype)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.top.equalTo(20);
        make.height.equalTo(btn.mas_width).multipliedBy(175/320.0);
    }];
    [btn bk_addEventHandler:^(id sender) {
        MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc]initWithContentURL:[self.videoModel contentVideo].yx_URL];
        [self.navigationController presentViewController:vc animated:YES completion:nil];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    [self.videoModel getVideoContentCompltionHandler:^(NSError *error) {
        if (error) {
            DDLogError(@"%@",error);
        }else{
            [btn setBackgroundImageWithURL:[self.videoModel videoLitpic].yx_URL forState:UIControlStateNormal placeholder:nil];
        }
        
    }];
    
    
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
