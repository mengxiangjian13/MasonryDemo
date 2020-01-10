//
//  MMCollectionViewCell.m
//  MasonryDemo
//
//  Created by mengxiangjian on 2020/1/9.
//  Copyright © 2020 mengxiangjian. All rights reserved.
//

#import "MMCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface MMCollectionViewCell ()

@property (nonatomic, strong) UIImageView *thumbView;
@property (nonatomic, strong) UIView *cornerTag;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *numberLabel;

@end

@implementation MMCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView addSubview:self.thumbView];
        [self.contentView addSubview:self.cornerTag];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.numberLabel];
        
        [self.thumbView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        [self.cornerTag mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.thumbView.mas_top).offset(4);
            make.right.equalTo(self.thumbView.mas_right).offset(-10.f);
            make.size.mas_equalTo(CGSizeMake(25, 12));
        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.thumbView.mas_bottom).offset(-10);
            make.left.equalTo(self.thumbView.mas_left).offset(5);
            make.right.equalTo(self.iconView.mas_left).offset(-5);
        }];
        
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.thumbView.mas_bottom).offset(-10);
            make.right.equalTo(self.thumbView.mas_right).offset(-5);
        }];
        
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.numberLabel.mas_bottom);
            make.right.equalTo(self.numberLabel.mas_left).offset(-2);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
    }
    return self;
}

- (void)showWithTitle:(NSString *)title
               number:(NSString *)number {
    self.nameLabel.text = title;
    self.numberLabel.text = number;
}

- (UIImageView *)thumbView {
    if (!_thumbView) {
        _thumbView = [[UIImageView alloc] init];
        _thumbView.backgroundColor = [UIColor redColor];
    }
    return _thumbView;
}

- (UIView *)cornerTag {
    if (!_cornerTag) {
        _cornerTag = [[UIView alloc] init];
        _cornerTag.backgroundColor = [UIColor yellowColor];
    }
    return _cornerTag;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:12.f];
        _nameLabel.textColor = [UIColor whiteColor];
        // 设置压缩优先级低，这样nameLabel可以在空间不够的时候压缩
        [_nameLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                                    forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _nameLabel;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.backgroundColor = [UIColor blueColor];
    }
    return _iconView;
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.font = [UIFont boldSystemFontOfSize:12.f];
        _numberLabel.textColor = [UIColor whiteColor];
        // 设置压缩优先级高，这样numberLabel可以在空间不够的时候保持不变
        [_numberLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                      forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _numberLabel;
}

@end
