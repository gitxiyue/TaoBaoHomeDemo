//
//  TitlesImageView.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/12.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "TitlesImageView.h"

@implementation TitlesImageView {
    __weak IBOutlet UILabel *title;
    __weak IBOutlet UILabel *subTitle;
    __weak IBOutlet UIImageView *imageview;
}

- (void)awakeFromNib {

}

- (void)setTitle:(NSString*)str color:(UIColor*)aColor size:(CGFloat)aSize {
    title.text = str;
    title.textColor = aColor;
    title.font = [UIFont boldSystemFontOfSize:aSize];
}
- (void)setSubTitle:(NSString*)str color:(UIColor*)aColor size:(CGFloat)aSize {
    subTitle.text = str;
    subTitle.textColor = aColor;
    subTitle.font = [UIFont systemFontOfSize:aSize];
}
- (void)setImage:(UIImage*)aImage {
    imageview.image = aImage;
}

@end
