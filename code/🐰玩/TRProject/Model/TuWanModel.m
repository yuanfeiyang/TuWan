//
//  TuWanModel.m
//  TRProject
//
//  Created by spare on 16/6/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanModel.h"

@implementation TuWanModel



@end



@implementation TuWanDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"indexpic" : [TuWanDataIndexpic class],@"list" : [TuWanDataList class]};

}


@end


@implementation TuWanDataIndexpic

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{

    return @{@"showitem" : [TuWanDataIndexpicShowitem class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName" : @"typename",@"Description" : @"description"};
}


@end


@implementation TuWanDataIndexpicInfochild



@end


@implementation TuWanDataIndexpicShowitem

@end


@implementation TuWanDataIndexpicShowitemInfo

@end


@implementation TuWanDataList
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"showitem" : [TuWanDataListShowitem class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName" : @"typename",@"Description" : @"description"};
}

@end


@implementation TuWanDataListInfochild

@end


@implementation TuWanDataListShowitem

@end


@implementation TuWanDataListShowitemInfo

@end


