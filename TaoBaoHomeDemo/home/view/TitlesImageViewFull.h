//
//  TitlesImageViewFull.h
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/13.
//  Copyright © 2016年 xun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitlesImageViewFull : UIView

- (void)setImage:(UIImage *)img titleIcon:(UIImage *)icon;

- (void)setTitle:(NSString *)str1
        subTitle:(NSString *)str2
           size1:(CGFloat)s1
           size2:(CGFloat)s2
          color1:(UIColor *)c1
          color2:(UIColor *)c2;

//方便背景间隔条，直接把self背景设置白色就好。默认的padding为0
- (void)setPadding:(CGFloat)padding;
@end
