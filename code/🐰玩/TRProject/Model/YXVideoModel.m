//
//  YXVideoModel.m
//  TRProject
//
//  Created by spare on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXVideoModel.h"

@implementation YXVideoModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"relevant" : [YXVideoRelevant class],@"content" : [YXVideoContent class]};

}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName" : @"typename" , @"Description" : @"description"};

}

@end



@implementation YXVideoContent


@end


@implementation YXVideoRelevant

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName" : @"typename" , @"Description" : @"description"};
    
}


@end


