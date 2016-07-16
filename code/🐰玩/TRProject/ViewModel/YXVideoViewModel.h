//
//  YXVideoViewModel.h
//  TRProject
//
//  Created by spare on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXVideoModel.h"

@interface YXVideoViewModel : NSObject

- (instancetype)initWithAid:(NSString *)aid;
/** <#属性描述#> */
@property (nonatomic, readonly) NSString *aid;

- (void)getVideoContentCompltionHandler:(void(^)(NSError *error))completionHandler;
/** <#属性描述#> */
@property (nonatomic) NSArray<YXVideoModel *> *VideoModel;

- (NSString *)contentVideo;

- (NSString *)videoLitpic;
/** <#属性描述#> */
@property (nonatomic) NSInteger rowNumber;



@end
