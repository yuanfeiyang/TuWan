//
//  TuPianViewModel.m
//  TRProject
//
//  Created by spare on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuPianViewModel.h"
#import "YXTuWanNetManager.h"

@implementation TuPianViewModel
- (instancetype)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;

}
- (void)getTuPianContentCompltionHandler:(void (^)(NSError *))completionHandler{
    [YXTuWanNetManager getTuPianContentAid:_aid CompletionHandler:^(id model, NSError *error) {
    _tuPianModel = model;
        !completionHandler ?: completionHandler(error);
    }];


}
- (NSString *)contentForRow:(NSInteger)row{
    NSMutableString *str = nil;
    str = self.tuPianModel.firstObject.content[row].pic.mutableCopy;
    NSString *str1 = [str substringToIndex:6];
    NSString *str2 = [str substringFromIndex:81];
    NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];
    
    return str3;
//    return self.tuPianModel.firstObject.content[row].pic;
}
- (NSInteger )rowNumber{
    return self.tuPianModel.firstObject.content.count;

}
@end
