//
//  GridCell3.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/11.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "GridCell3.h"

@implementation GridCell3 {
    __weak IBOutlet UIImageView *iv;
}

- (void)awakeFromNib {
    // Initialization code
    iv.layer.cornerRadius  = (SCREEN_W/5-8/5 -10) /2;
    iv.layer.masksToBounds = YES;
    iv.clipsToBounds = YES;
}

//为什么获取的不是正确的值，值是xib对应的width，非实际width
//本来 cornerRadius 是设置在这里的
//有大神知道的指点下 谢谢
- (void)layoutSubviews {
    [super layoutSubviews];
    XunLog(@"宽度 %f", iv.frame.size.width);
    //iv.layer.cornerRadius  = iv.frame.size.width /2;
}

@end
