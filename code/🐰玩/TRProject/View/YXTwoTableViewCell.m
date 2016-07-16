//
//  YXTwoTableViewCell.m
//  TRProject
//
//  Created by spare on 16/6/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXTwoTableViewCell.h"

@implementation YXTwoTableViewCell

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(10);
            make.right.equalTo(self.clickLb.mas_left).equalTo(-10);
        }];
    }
    return _titleLb;

}
- (UILabel *)clickLb{
    if (!_clickLb) {
        _clickLb = [UILabel new];
        _clickLb.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_clickLb];
        [_clickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(8);
            make.right.equalTo(-10);
            make.width.equalTo(80);
        }];
    }
    return _clickLb;

}

- (UIImageView *)iconImage1{
    if (!_iconImage1) {
        _iconImage1 =[UIImageView new];
        _iconImage1.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_iconImage1];
        [_iconImage1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.titleLb.mas_bottom).equalTo(8);
            make.width.equalTo((kScreenW-40)/3);
            //make.height.equalTo((kScreenW-40)/3*960/640);
            make.height.equalTo(80);
        }];
    }
    return _iconImage1;

}
- (UIImageView *)iconImage2{
    if (!_iconImage2) {
        _iconImage2 =[UIImageView new];
       _iconImage2.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_iconImage2];
        [_iconImage2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImage1.mas_right).equalTo(10);
            make.top.equalTo(self.titleLb.mas_bottom).equalTo(8);
            make.width.equalTo((kScreenW-40)/3);
           // make.height.equalTo((kScreenW-40)/3*960/640);
            make.height.equalTo(80);
        }];
    }
    return _iconImage2;
    
}
- (UIImageView *)iconImage3{
    if (!_iconImage3) {
        _iconImage3 =[UIImageView new];
        _iconImage3.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_iconImage3];
        [_iconImage3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImage2.mas_right).equalTo(10);
            make.top.equalTo(self.titleLb.mas_bottom).equalTo(8);
            make.right.equalTo(-10);
            make.width.equalTo((kScreenW-40)/3);
            //make.height.equalTo((kScreenW-40)/3*960/640);
            make.height.equalTo(80);
        }];
    }
    return _iconImage3;
    
}

- (NSArray<UIImageView *> *)icons{
    if (!_icons) {
        UIImageView *lastIcon = nil;
        NSMutableArray *tmpArr = [NSMutableArray new];
        for (int i =0; i<3; i++) {
            UIImageView *icon = [UIImageView new];
            icon.contentMode = UIViewContentModeScaleToFill;
            [self.contentView addSubview:icon];
            [icon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLb.mas_bottom).equalTo(8);
                //make.bottom.equalTo(-10);
                make.width.equalTo((kScreenW-40)/3);
                //make.height.equalTo((kScreenW-40)/3*960/640);
                make.height.equalTo(100);
                if (!lastIcon) {
                    make.left.equalTo(10);
                }else{
                    make.left.equalTo(lastIcon.mas_right).equalTo(10);
                    if (i==2) {
                    make.right.equalTo(-10);
                    }
                }
                
            }];
            lastIcon = icon;
            [tmpArr addObject:icon];
            
            }
        _icons = tmpArr.mutableCopy;
    }
    return _icons;


}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self iconImage3];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
