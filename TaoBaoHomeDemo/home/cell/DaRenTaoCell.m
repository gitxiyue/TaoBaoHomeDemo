//
//  DaRenTaoCell.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/12.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "DaRenTaoCell.h"
#import "UIGestureRecognizer+YYAdd.h"
#import "XunUtils.h"
#import "TitlesImageView.h"
#import "TitlesImageViewFull.h"

@implementation DaRenTaoCell {
    __weak IBOutlet UIView *mainView;
    
    TitlesImageViewFull *view1, *view2, *view3;
}

- (void)awakeFromNib {
    // Initialization code
    mainView.backgroundColor = [UIColor whiteColor];
    view1 = [[TitlesImageViewFull alloc] init];
    view2 = [[TitlesImageViewFull alloc] init];
    view3 = [[TitlesImageViewFull alloc] init];
    [mainView addSubview:view1];
    [mainView addSubview:view2];
    [mainView addSubview:view3];
    CGFloat height = (SCREEN_W-32)/3 +14+3+12+3;
    XunLog(@"%f", height);
    view1.frame = CGRectMake(8, 6, (SCREEN_W-32)/3, height);
    view2.frame = CGRectMake(8+(SCREEN_W-32)/3+8, 6, (SCREEN_W-32)/3, height);
    view3.frame = CGRectMake(8+(SCREEN_W-32)/3+8+(SCREEN_W-32)/3+8, 6, (SCREEN_W-32)/3, height);
    
    [view1 setTitle:@"红人圈" subTitle:@"别怕，红人圈来了" size1:14 size2:12 color1:[UIColor redColor] color2:[UIColor lightGrayColor]];
    [view1 setImage:[UIImage imageNamed:@"mini1.png"] titleIcon:[UIImage imageNamed:@"hot.png"]];
    
    [view2 setTitle:@"视频直播" subTitle:@"别怕，学会保护自己!" size1:14 size2:12 color1:[UIColor greenColor] color2:[UIColor lightGrayColor]];
    [view2 setImage:[UIImage imageNamed:@"mini2.png"] titleIcon:nil];
    
    [view3 setTitle:@"搭配控" subTitle:@"我有我的fan" size1:14 size2:12 color1:[UIColor orangeColor] color2:[UIColor lightGrayColor]];
    [view3 setImage:[UIImage imageNamed:@"mini3.png"] titleIcon:nil];
    
    [view1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
        [XunUtils show:@"红人圈"];
    }]];
    [view2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
        [XunUtils show:@"视频直播"];
    }]];
    [view3 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
        [XunUtils show:@"搭配控"];
    }]];
}

- (CGFloat)getHeight {
    return (SCREEN_W-32)/3 +8+30+8+42+42;
}

@end
