//
//  YXTuWanNetManager.m
//  TRProject
//
//  Created by spare on 16/6/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXTuWanNetManager.h"
#import "TuWanModel.h"
#import "YXVideoModel.h"
@implementation YXTuWanNetManager

+ (id)getTuWanDataListType:(DataListType)type WithPage:(NSInteger)page CompletionHandler:(void (^)(id, NSError *))completionHandler{
   // NSString *path = [NSString stringWithFormat:kTouTiaoPath,page];
    NSString *path = nil;
    switch (type) {
        case DataListTypeTouTiao: {
            path = [NSString stringWithFormat:kTouTiaoPath,page];
            break;
        }
        case DataListTypeDuJia: {
            path = [NSString stringWithFormat:kDuJiaPath,page];
            
            break;
        }
        case DataListTypeAnHei: {
            path = [NSString stringWithFormat:kAnHeiPath,page];
            break;
        }
        case DataListTypeMoShou: {
            path = [NSString stringWithFormat:kMoShouPath,page];
            break;
        }
        case DataListTypeFenBao: {
            path = [NSString stringWithFormat:kFengBaoPath,page];
            break;
        }
        case DataListTypeLuShi: {
            path = [NSString stringWithFormat:kLuShiPath,page];
            break;
        }
        case DataListTypeXingJi: {
            path = [NSString stringWithFormat:kXingJiPath,page];
            break;
        }
        case DataListTypeShouWang: {
            path = [NSString stringWithFormat:kShouWangPath,page];
            break;
        }
        case DataListTypeTuPian: {
            path = [NSString stringWithFormat:kTuPianPath,page];
            break;
        }
        case DataListTypeShiPing: {
            path = [NSString stringWithFormat:kShiPing,page];
            break;
        }
        case DataListTypeGongLie: {
            path = [NSString stringWithFormat:kGongLie,page];
            break;
        }
        case DataListTypeHuanHua: {
            path = [NSString stringWithFormat:kHuanHuaPath,page];
            break;
        }
        case DataListTypeQuWen: {
            path = [NSString stringWithFormat:kQuWenPath,page];
            break;
        }
        case DataListTypeCOS: {
            path = [NSString stringWithFormat:kCOSPath,page];
            break;
        }
        case DataListTypeMeiNv: {
            path = [NSString stringWithFormat:kMeiNvPath,page];
            break;
        }
    }
    
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
   return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([TuWanModel parseJSON:jsonObject],error);
    }];
    
}

+ (id)getTuPianContentAid:(NSString *)aid CompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kTuPianpPicPath,aid];
    
    
    return [self GETPic:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
       // NSLog(@"%@",jsonObject);
         !completionHandler ?: completionHandler([YXTuPianModel parseJSON:jsonObject],error);
        NSLog(@"%@",[YXTuPianModel parseJSON:jsonObject]);
    }];
    
}


+ (id)getVideoContentAid:(NSString *)aid CompletionHandler:(void (^)(id, NSError *))completionHandler{
    
    NSString *path = [NSString stringWithFormat:kVideoPath,aid];
        
    return [self GETPic:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        // NSLog(@"%@",jsonObject);
        !completionHandler ?: completionHandler([YXVideoModel parseJSON:jsonObject],error);
        NSLog(@"%@",[YXVideoModel parseJSON:jsonObject]);
    }];
    
}



@end
