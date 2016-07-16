//
//  YXTableViewController.h
//  TRProject
//
//  Created by spare on 16/6/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXViewModel.h"

@interface YXTableViewController : UITableViewController
- (instancetype)initWithStyle:(UITableViewStyle)style dataListType:(DataListType)type;

/** <#属性描述#> */
@property (nonatomic, readonly) DataListType dataListType;
/** <#属性描述#> */
@property (nonatomic,readonly) NSString *aid;

@end
