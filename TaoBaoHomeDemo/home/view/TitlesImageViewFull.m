//
//  TitlesImageViewFull.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/13.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "TitlesImageViewFull.h"

@interface TitlesImageViewFull()

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *subtitle;
@property (nonatomic, strong) UIImageView *iconview;
@property (nonatomic, strong) UIImageView *imageview;

@end
@implementation TitlesImageViewFull

- (instancetype)init {
    self = [super init];
    if (self) {
        //
        [self setUpView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self setUpView];
    }
    return self;
}

- (void)setUpView {
    _title = [[UILabel alloc] init];
    _subtitle = [[UILabel alloc] init];
    _iconview = [[UIImageView alloc] init];
    _imageview = [[UIImageView alloc] init];
    _imageview.contentMode = UIViewContentModeScaleAspectFit;
    //_imageview.backgroundColor = [UIColor purpleColor];
    //_iconview.backgroundColor = [UIColor purpleColor];
    _iconview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_title];
    [self addSubview:_subtitle];
    [self addSubview:_iconview];
    [self addSubview:_imageview];
    
    [_title makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(0);
        make.width.greaterThanOrEqualTo(40);
        make.height.equalTo(14);
    }];
    [_iconview makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.equalTo(_title.right).offset(4);
        make.width.greaterThanOrEqualTo(10);
        make.height.equalTo(_title.height);
    }];
    [_subtitle makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.top.equalTo(_title.bottom).offset(3);
        make.height.equalTo(12);
    }];
    [_imageview makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(0);
        make.top.equalTo(_subtitle.bottom).offset(3);
    }];
}

- (void)setTitle:(NSString *)str1 subTitle:(NSString *)str2 size1:(CGFloat)s1 size2:(CGFloat)s2 color1:(UIColor *)c1 color2:(UIColor *)c2 {
    _title.text = str1;
    _title.textColor = c1;
    _title.font = [UIFont boldSystemFontOfSize:s1];
    _subtitle.text = str2;
    _subtitle.textColor = c2;
    _subtitle.font = [UIFont systemFontOfSize:s2];
    
    [_title updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(s1);
    }];
    [_subtitle updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(s2);
    }];
    //
    [self layoutIfNeeded];
}

- (void)setImage:(UIImage *)img titleIcon:(UIImage *)icon {
    //XunLog(@"icon size %@", NSStringFromCGSize(icon.size));
    _imageview.image = img;
    _iconview.image  = icon;
}

- (void)setPadding:(CGFloat)padding {
    [_title updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(padding);
    }];
    [_subtitle updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(padding);
    }];
    [_imageview updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(padding);
        make.right.equalTo(-padding);
    }];
    //
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

@end











