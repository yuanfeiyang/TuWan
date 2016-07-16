//
//  TRPicViewController.h
//  TRProject
//
//  Created by spare on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <MWPhotoBrowser/MWPhotoBrowser.h>

@interface TRPicViewController : MWPhotoBrowser
- (instancetype)initWithAid:(NSString *)aid;
/** <#属性描述#> */
@property (nonatomic,readonly) NSString *aid;


@end
