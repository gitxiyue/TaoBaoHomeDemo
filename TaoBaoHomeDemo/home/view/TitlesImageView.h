//
//  TitlesImageView.h
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/12.
//  Copyright © 2016年 xun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitlesImageView : UIView

- (void)setTitle:(NSString*)str color:(UIColor*)aColor size:(CGFloat)aSize;
- (void)setSubTitle:(NSString*)str color:(UIColor*)aColor size:(CGFloat)aSize;
- (void)setImage:(UIImage*)aImage;
@end
