//
//  YXViewModel.h
//  TRProject
//
//  Created by spare on 16/6/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXTuWanNetManager.h"
#import "TuWanModel.h"
#import "TRBaseViewModel.h"

@interface YXViewModel : TRBaseViewModel


/** <#属性描述#> */
@property (nonatomic) NSInteger rowNumber;
//- (NSInteger)showTypeForRow:(NSInteger)row;
//小标题
- (NSString *)descriptionForRow:(NSInteger)row;
//大标题
- (NSString *)titleForRow:(NSInteger)row;
//图片
- (NSURL *)litpicURLForRow:(NSInteger)row;
//多少人浏览
- (NSString *)clickForRow:(NSInteger)row;

/** <#属性描述#> */
@property (nonatomic) NSInteger page;

/** <#属性描述#> */
@property (nonatomic,readonly)  DataListType dataListType;
- (instancetype)initWithType:(DataListType)type;
/** <#属性描述#> */
@property (nonatomic) NSArray<TuWanDataIndexpic *> *indexPicList;
- (NSURL *)iconForRow:(NSInteger)row;

//- (void)getTuWanWithCompletionHandler:(void(^)(NSError *error))completionHandler;
/** <#属性描述#> */
@property (nonatomic) TuWanModel *tuWanModel;
/** data->List */
@property (nonatomic) NSMutableArray<TuWanDataList *> *dataList;
/** <#属性描述#> */
//@property (nonatomic) NSArray<TuWanDataListShowitem *> *showItemList;
- (NSArray<TuWanDataListShowitem *>*)showItemForRow:(NSInteger)row;

//- (NSURL *)icon1URLShowForRow:(NSInteger)row;
//- (NSURL *)icon2URLShowForRow:(NSInteger)row;
//- (NSURL *)icon3URLShowForRow:(NSInteger)row;
/** <#属性描述#> */
@property (nonatomic,readonly) BOOL isLoadMore;

- (NSURL *)infoIconURLForRow:(NSInteger)row index:(NSInteger)index;

/** <#属性描述#> */
@property (nonatomic) NSInteger headerNumber;
- (NSURL *)detailHtmlForRow:(NSInteger)row;

- (NSString *)typeForRow:(NSInteger)row;



//@property (nonatomic, readonly) NSString *aid;
//
//- (void)getTuPianContentCompltionHandler:(void(^)(NSError *error))completionHandler;
///** <#属性描述#> */
//@property (nonatomic) NSArray<YXTuPianModel *> *tuPianModel;
//- (NSString *)contentForRow:(NSInteger)row;
///** <#属性描述#> */
//@property (nonatomic) NSInteger contentrowNumber;

- (NSString *)aidForRow:(NSInteger)row;


@end
