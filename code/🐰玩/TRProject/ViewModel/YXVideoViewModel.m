//
//  YXVideoViewModel.m
//  TRProject
//
//  Created by spare on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXVideoViewModel.h"
#import "YXTuWanNetManager.h"

@implementation YXVideoViewModel
- (instancetype)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;
    
}
- (void)getVideoContentCompltionHandler:(void (^)(NSError *))completionHandler{
    [YXTuWanNetManager getVideoContentAid:_aid CompletionHandler:^(id model, NSError *error) {
        _VideoModel = model;
        !completionHandler ?: completionHandler(error);
    }];
    
}

- (NSString *)videoLitpic{
    NSMutableString *str = nil;
    str = self.VideoModel.firstObject.litpic.mutableCopy;
    NSString *str1 = [str substringToIndex:6];
    NSString *str2 = [str substringFromIndex:81];
    NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];
    
    return str3;


}

- (NSString *)contentVideo{
        //NSMutableString *str = nil;
        //str = self.VideoModel.firstObject.content.firstObject.video.mutableCopy;
        //NSString *str1 = [str substringToIndex:6];
        //NSString *str2 = [str substringFromIndex:81];
        //NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];
    
        //return str3;
    
    return self.VideoModel.firstObject.content.firstObject.video;
}
- (NSInteger )rowNumber{
    return self.VideoModel.firstObject.content.count;
    
}

@end
