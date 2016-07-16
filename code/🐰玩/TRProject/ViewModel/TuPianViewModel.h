//
//  TuPianViewModel.h
//  TRProject
//
//  Created by spare on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXTuPianModel.h"
@interface TuPianViewModel : NSObject

- (instancetype)initWithAid:(NSString *)aid;
/** <#属性描述#> */
@property (nonatomic, readonly) NSString *aid;

- (void)getTuPianContentCompltionHandler:(void(^)(NSError *error))completionHandler;
/** <#属性描述#> */
@property (nonatomic) NSArray<YXTuPianModel *> *tuPianModel;
- (NSString *)contentForRow:(NSInteger)row;
/** <#属性描述#> */
@property (nonatomic) NSInteger rowNumber;

@end
