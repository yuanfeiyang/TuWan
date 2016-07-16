//
//  YXTuPianModel.m
//  TRProject
//
//  Created by spare on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXTuPianModel.h"

@implementation YXTuPianModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{

    return @{@"showitem" : [TuPianShowitem class],@"relevant" : [TuPianRelevant class],@"content" : [TuPianContent class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName" : @"typename" , @"Description" : @"description"};

}
@end



@implementation TuPianInfochild

@end


@implementation TuPianShowitem

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{

    return @{@"width" : @"info.width",@"height" : @"info.height"};
}


@end





@implementation TuPianRelevant
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName" : @"typename" , @"Description" : @"description"};
    
}
@end


@implementation TuPianContent
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    
    return @{@"width" : @"info.width",@"height" : @"info.height"};
}
@end





