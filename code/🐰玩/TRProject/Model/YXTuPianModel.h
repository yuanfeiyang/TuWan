//
//  YXTuPianModel.h
//  TRProject
//
//  Created by spare on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TuPianInfochild,TuPianShowitem,TuPianRelevant,TuPianContent;
@interface YXTuPianModel : NSObject

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;
//typename->typeName
@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, strong) TuPianInfochild *infochild;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, strong) NSArray<TuPianShowitem *> *showitem;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, assign) NSInteger zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, strong) NSArray<TuPianRelevant *> *relevant;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, strong) NSArray<TuPianContent *> *content;
//description->Description
@property (nonatomic, copy) NSString *Description;




@end


@interface TuPianInfochild : NSObject

@property (nonatomic, copy) NSString *later;

@property (nonatomic, copy) NSString *cn;

@property (nonatomic, copy) NSString *facial;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, copy) NSString *shoot;

@end

@interface TuPianShowitem : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;


/** <#属性描述#> */
@property (nonatomic, strong) NSString *width;
/** <#属性描述#> */
@property (nonatomic, assign) NSInteger height;

@end



@interface TuPianRelevant : NSObject
//description->Description
@property (nonatomic, copy) NSString *Description;

@property (nonatomic, copy) NSString *litpic;
//typename->typeName
@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *pubdate;

@end

@interface TuPianContent : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;


/** <#属性描述#> */
@property (nonatomic, copy) NSString *width;
/** <#属性描述#> */
@property (nonatomic, assign) NSInteger height;

@end



