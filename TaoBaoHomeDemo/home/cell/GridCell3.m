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

//为什么不能用呢，一有这个方法就等比约束就不对啊
//本来 cornerRadius 是设置在这里的
//有大神知道的指点下 谢谢
//- (void)layoutSubviews {
//
//}

@end
