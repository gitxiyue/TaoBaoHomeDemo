//
//  TaoTiaoView.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/11.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "TaoTiaoView.h"

@implementation TaoTiaoView{
    __weak IBOutlet UILabel *lab1;
    __weak IBOutlet UILabel *lab2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //
    }
    return self;
}

- (void)setData:(NSString *)str1 str:(NSString *)str2 {
    lab1.text = str1;
    lab2.text = str2;
}

- (NSString *)toString {
    return lab1.text;
}

@end
