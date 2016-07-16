//
//  YXViewModel.m
//  TRProject
//
//  Created by spare on 16/6/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXViewModel.h"

@implementation YXViewModel
- (instancetype)initWithType:(DataListType)type{
    if (self = [super init]) {
        _dataListType = type;
    }
    return self;

}
- (NSMutableArray<TuWanDataList *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;

}
//- (NSInteger)showTypeForRow:(NSInteger)row{
//    return self.dataList[row].showtype;
//
//}

- (NSInteger)rowNumber{
    return _dataList.count;
}

- (NSString *)titleForRow:(NSInteger)row{
    return _dataList[row].title;

}
- (NSString *)descriptionForRow:(NSInteger)row{
    return _dataList[row].Description;

}
- (NSURL *)litpicURLForRow:(NSInteger)row{
   // return [NSURL URLWithString:_dataList[row].litpic];
    
    //NSMutableString *str = _dataList[row].litpic.mutableCopy;
    NSMutableString *str = nil;
    str = _dataList[row].litpic.mutableCopy;
    //NSRange range = [str rangeOfString:@"http://imgcache.tuwandata.com/v2/thumb/all/MGI2ZiwzMjAsMjQwLDQsMywxLC0xLE5PTkUs/u/"];
    
    //[str deleteCharactersInRange:range];
    NSString *str1 = [str substringToIndex:6];
    NSString *str2 = [str substringFromIndex:81];
    NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];
    
    
    return str3.yx_URL;
}
- (NSString *)clickForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%@人浏览",_dataList[row].click];

}
- (NSArray<TuWanDataListShowitem *> *)showItemForRow:(NSInteger)row{
    return _dataList[row].showitem;

}
- (NSURL *)infoIconURLForRow:(NSInteger)row index:(NSInteger)index{
   // TuWanDataListShowitem *model = self.dataList[row].showitem[index];
   // NSString *enName = [model valueForKey:self.dataList[row].showitem[index].pic];
    NSMutableString *str = nil;
    str = self.dataList[row].showitem[index].pic.mutableCopy;
    NSString *str1 = [str substringToIndex:6];
    NSString *str2 = [str substringFromIndex:81];
    NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];
    
    
    
    //return self.dataList[row].showitem[index].pic.yx_URL;

    return str3.yx_URL;
}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 0;
    if (requestMode == VMRequestModeMore) {
        tmpPage = self.page+11;
    }
    
    _dataTask = [YXTuWanNetManager getTuWanDataListType:_dataListType WithPage:tmpPage CompletionHandler:^(id model, NSError *error) {
        if (error) {
            DDLogError(@"%@",error);
        }else{
            _tuWanModel = model;
            if (requestMode == VMRequestModeRefresh) {
                _indexPicList = _tuWanModel.data.indexpic;
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:_tuWanModel.data.list];
            
            self.page = tmpPage;
            _isLoadMore = _tuWanModel.data.list.count == 10;
        }
        
        !completionHandler ?: completionHandler(error);
    }];
    
}

- (NSURL *)iconForRow:(NSInteger)row{
    NSMutableString *str = nil;
    str = self.indexPicList[row].litpic.mutableCopy;
    NSString *str1 = [str substringToIndex:6];
    NSString *str2 = [str substringFromIndex:81];
    NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];
    return str3.yx_URL;
}

- (NSInteger )headerNumber{
    return _indexPicList.count;
}
- (NSURL *)icon1URLShowForRow:(NSInteger)row{
    NSMutableString *str = nil;
    str = self.dataList[row].showitem[0].pic.mutableCopy;
    NSString *str1 = [str substringToIndex:6];
    NSString *str2 = [str substringFromIndex:81];
    NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];
    return str3.yx_URL;
}
- (NSURL *)icon2URLShowForRow:(NSInteger)row{

    NSMutableString *str = nil;
    str = self.dataList[row].showitem[1].pic.mutableCopy;
    NSString *str1 = [str substringToIndex:6];
    NSString *str2 = [str substringFromIndex:81];
    NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];
    return str3.yx_URL;
}
- (NSURL *)icon3URLShowForRow:(NSInteger)row{
    NSMutableString *str = nil;
    str = self.dataList[row].showitem[2].pic.mutableCopy;
    NSString *str1 = [str substringToIndex:6];
    NSString *str2 = [str substringFromIndex:81];
    NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];
    return str3.yx_URL;
}
- (NSURL *)detailHtmlForRow:(NSInteger)row{
    return [NSURL URLWithString:self.dataList[row].html5];

}
- (NSString *)typeForRow:(NSInteger)row{

    return self.dataList[row].type;
}



//- (void)getTuPianContentCompltionHandler:(void (^)(NSError *))completionHandler{
//    [YXTuWanNetManager getTuPianContentAid:_aid CompletionHandler:^(id model, NSError *error) {
//        _tuPianModel = model;
//    }];
//    
//    
//}
//- (NSString *)contentForRow:(NSInteger)row{
//    return self.tuPianModel.firstObject.content[row].pic;
//}
//- (NSInteger )contentrowNumber{
//    return self.tuPianModel.firstObject.content.count;
//    
//}
- (NSString *)aidForRow:(NSInteger)row{
   
    return self.dataList[row].aid;

}

@end
