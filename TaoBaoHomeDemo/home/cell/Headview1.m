//
//  Headview1.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/10.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "Headview1.h"

@implementation Headview1 {
    __weak IBOutlet UIScrollView *scroll;
}

- (void)awakeFromNib {
    // Initialization code
    [self initFlash];
}

- (void)initFlash {
    scroll.contentSize = CGSizeMake(SCREEN_W *2, SCREEN_W/4);
    scroll.pagingEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator   = NO;
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_W/4)];
    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_W, 0, SCREEN_W, SCREEN_W/4)];
    image1.image = [UIImage imageNamed:@"image2.jpg"];
    image2.image = [UIImage imageNamed:@"image4.jpg"];
    [scroll addSubview:image1];
    [scroll addSubview:image2];
}

@end
