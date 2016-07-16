//
//  YXTuWanNetManager.h
//  TRProject
//
//  Created by spare on 16/6/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXTuPianModel.h"
typedef NS_ENUM(NSUInteger, DataListType) {
    DataListTypeTouTiao,
    DataListTypeDuJia,
    DataListTypeAnHei,
    DataListTypeMoShou,
    DataListTypeFenBao,
    DataListTypeLuShi,
    DataListTypeXingJi,
    DataListTypeShouWang,
    DataListTypeTuPian,
    DataListTypeShiPing,
    DataListTypeGongLie,
    DataListTypeHuanHua,
    DataListTypeQuWen,
    DataListTypeCOS,
    DataListTypeMeiNv,
};



@interface YXTuWanNetManager : NSObject

+ (id)getTuWanDataListType:(DataListType)type WithPage:(NSInteger)page CompletionHandler:(void(^)(id model,NSError *error))completionHandler;

+ (id)getTuPianContentAid:(NSString *)aid CompletionHandler:(void(^)(id model,NSError *error))completionHandler;

+ (id)getVideoContentAid:(NSString *)aid CompletionHandler:(void(^)(id model,NSError *error))completionHandler;

@end
