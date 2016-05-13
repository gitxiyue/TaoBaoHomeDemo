//
//  HotShiChangCell.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/13.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "HotShiChangCell.h"
#import "TitlesImageViewFull.h"
#import "XunUtils.h"
#import "UIGestureRecognizer+YYAdd.h"

@interface HotShiChangCell() {
    __weak IBOutlet UIView *mainView;
    TitlesImageViewFull *view1, *view2;
}
@property (nonatomic, strong) NSArray *dataArr;
@end
@implementation HotShiChangCell

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = @[
                     @{@"title":@"内衣", @"subtitle":@"性感装备", @"image":@"06.jpg", @"icon":@""},
                     @{@"title":@"数码", @"subtitle":@"潮流新机", @"image":@"06.jpg", @"icon":@""},
                     @{@"title":@"运动", @"subtitle":@"潮流新品", @"image":@"07.jpg", @"icon":@""},
                     @{@"title":@"家电", @"subtitle":@"爆款现货抢", @"image":@"06.jpg", @"icon":@""},
                     @{@"title":@"美女", @"subtitle":@"暖被窝女神", @"image":@"07.jpg", @"icon":@""},
                     @{@"title":@"质+", @"subtitle":@"休息裙", @"image":@"06.jpg", @"icon":@""},
                     @{@"title":@"中老年", @"subtitle":@"巧策", @"image":@"07.jpg", @"icon":@""},
                     @{@"title":@"篮球公园", @"subtitle":@"虎扑识货", @"image":@"06.jpg", @"icon":@""}
                     ];
    }
    return _dataArr;
}

- (void)awakeFromNib {
    // Initialization code
    mainView.backgroundColor = [UIColor clearColor];
    view1 = [[TitlesImageViewFull alloc] init];
    view2 = [[TitlesImageViewFull alloc] init];
    view1.backgroundColor = [UIColor whiteColor];
    view2.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:view1];
    [mainView addSubview:view2];
    view1.frame = CGRectMake(0, 0, (SCREEN_W-1)/2, 120);
    view2.frame = CGRectMake((SCREEN_W-1)/2+1, 0, (SCREEN_W-1)/2, 120);
    [view1 setTitle:@"家具" subTitle:@"尖货推荐" size1:14 size2:12 color1:[UIColor blackColor] color2:[UIColor lightGrayColor]];
    [view2 setTitle:@"女装" subTitle:@"新品推荐" size1:14 size2:12 color1:[UIColor blackColor] color2:[UIColor lightGrayColor]];
    [view1 setImage:[UIImage imageNamed:@"05.jpg"] titleIcon:nil];
    [view2 setImage:[UIImage imageNamed:@"05.jpg"] titleIcon:nil];
    [view1 setPadding:8];
    [view2 setPadding:8];
    [view1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
        [XunUtils show:@"家具"];
    }]];
    [view2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
        [XunUtils show:@"女装"];
    }]];
    [self initData];
    
}

- (void)initData {
    TitlesImageViewFull *view;
    //当前i的数据
    float x = 0;
    float y = 0;
    int row = 0;
    int col = 0;
    float width  = (SCREEN_W-3)/4; //间隔为1，4列，总间隔3
    float height = 100;
    for (int i=0; i<self.dataArr.count; i++) {
        NSDictionary *dic = self.dataArr[i];
        view = [[TitlesImageViewFull alloc] init];
        view.userInteractionEnabled = YES;
        if (i%4 == 0) {
            row = (i/4); XunLog(@"行 %zd", (i/4));
        }
        col = (i%4);     XunLog(@" 列 %zd", (i%4));
        x = (SCREEN_W-3)/4*i + col - row*(SCREEN_W-3);
        y = 120 +row*1+1 +row*height;//顶部 间隔 行高
        view.frame = CGRectMake(x, y, width, height);
        if (i == _dataArr.count-1 || i == _dataArr.count -2) {
            [view setTitle:dic[@"title"] subTitle:dic[@"subtitle"] size1:13 size2:11 color1:[UIColor orangeColor] color2:[UIColor grayColor]];
        }else {
            [view setTitle:dic[@"title"] subTitle:dic[@"subtitle"] size1:13 size2:11 color1:[UIColor blackColor] color2:[UIColor lightGrayColor]];
        }
        [view setImage:[UIImage imageNamed:dic[@"image"]] titleIcon:nil];
        [view setPadding:8];
        view.backgroundColor = [UIColor whiteColor];
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
            [XunUtils show:dic[@"title"]];
        }]];
        [mainView addSubview:view];
    }
}

@end
