//
//  Footview0.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/11.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "Footview0.h"
#import "TaoTiaoView.h"

@interface Footview0() {
    __weak IBOutlet UIView *mainview;
    TaoTiaoView *ttv1, *ttv2;
}

@end

@implementation Footview0

- (void)awakeFromNib {
    // Initialization code
}

- (void)layoutSubviews {
    ttv1 = [[NSBundle mainBundle] loadNibNamed:@"TaoTiaoView" owner:self options:nil].lastObject;
    
    ttv2 = [[NSBundle mainBundle] loadNibNamed:@"TaoTiaoView" owner:self options:nil].lastObject;
    [mainview addSubview:ttv1];
    [mainview addSubview:ttv2];
    ttv1.frame = CGRectMake(0, 0,  mainview.frame.size.width, mainview.frame.size.height);
    ttv2.frame = CGRectMake(0, 50, mainview.frame.size.width, mainview.frame.size.height);
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(gun) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    XunLog(@"%@", NSStringFromCGRect(mainview.frame));
}

- (void)gun {
    //XunLog(@"滚动");
}

@end
