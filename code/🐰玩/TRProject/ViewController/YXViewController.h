//
//  YXViewController.h
//  TRProject
//
//  Created by spare on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXViewController : UIViewController
- (instancetype)initWithURL:(NSURL *)detailURL;
/** <#属性描述#> */
@property (nonatomic, readonly) NSURL *detailURL;
@end
