//
//  YXTableViewCell.m
//  TRProject
//
//  Created by spare on 16/6/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXTableViewCell.h"

@implementation YXTableViewCell
- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [UIImageView new];
        _iconImage.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_iconImage];
        [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(10);
            make.bottom.equalTo(-10);
            make.width.equalTo(100);
            //make.height.equalTo(100*140/185);
            //make.height.equalTo(100);
        }];
    }
    return _iconImage;

}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImage.mas_right).equalTo(10);
            make.top.equalTo(12);
            
            
        }];
    }
    return _titleLb;

}
- (UILabel *)descriptionLb{
    if (!_descriptionLb) {
        _descriptionLb = [UILabel new];
        _descriptionLb.numberOfLines = 2;
        [_descriptionLb sizeToFit];
        _descriptionLb.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:_descriptionLb];
        [_descriptionLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImage.mas_right).equalTo(10);
            make.right.equalTo(-10);
            make.bottom.equalTo(-8);
            make.height.equalTo(60);
        }];
    }
    return _descriptionLb;

}
- (UILabel *)clickLb{
    if (!_clickLb) {
        _clickLb = [UILabel new];
        _clickLb.font = [UIFont systemFontOfSize:15];
        [self.descriptionLb addSubview:_clickLb];
        [_clickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.bottom.equalTo(-2);
        }];
    }
    return _clickLb;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self titleLb];
    [self description];
    [self clickLb];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
