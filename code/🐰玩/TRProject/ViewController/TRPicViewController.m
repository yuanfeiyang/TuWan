//
//  TRPicViewController.m
//  TRProject
//
//  Created by spare on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRPicViewController.h"
#import "TuPianViewModel.h"
#import "YXViewModel.h"
@interface TRPicViewController ()<MWPhotoBrowserDelegate>
/** <#属性描述#> */
@property (nonatomic) TuPianViewModel *tuPianList;
/** <#属性描述#> */
//@property (nonatomic) YXViewModel *yxViewM;
@end

@implementation TRPicViewController
//- (YXViewModel *)yxViewM{
//    if (!_yxViewM) {
//        _yxViewM = [[YXViewModel alloc]init];
//    }
//    return _yxViewM;
//
//}
- (TuPianViewModel *)tuPianList{
    if (!_tuPianList) {
        _tuPianList = [[TuPianViewModel alloc]initWithAid:_aid];
    }
    return _tuPianList;

}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    //有多少个图片，是返回值中content数组
    return self.tuPianList.rowNumber;

}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    return [MWPhoto photoWithURL:[self.tuPianList contentForRow:index].yx_URL];
}


- (instancetype)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;

}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self.tuPianList getTuPianContentCompltionHandler:^(NSError *error) {
        NSLog(@"1111");
        if (error) {
            DDLogError(@"%@",error);
        }else{
        [self reloadData];
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
