//
//  Headview3.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/10.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "Headview3.h"

@implementation Headview3 {
    __weak IBOutlet UILabel *lable;
}

- (void)awakeFromNib {
    // Initialization code
    lable.backgroundColor = RGBA(245, 245, 245, 1);
}

@end
