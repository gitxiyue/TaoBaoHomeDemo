//
//  Footview0.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/11.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "Footview0.h"
#import "TaoTiaoView.h"

@interface Footview0()<UIScrollViewDelegate> {
    __weak IBOutlet UIView *mainview;
    TaoTiaoView *ttv1, *ttv2, *ttv3;
    UIScrollView *scroll;
    CGFloat sHeight, sWidth;
}
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger currentIndex;
@property (strong, nonatomic) NSArray *dataArr;

@end

@implementation Footview0

- (void)awakeFromNib {
    // Initialization code
    
    _dataArr = @[@"111尼玛xx门又出现了啊，为什么没有我啊",
                 @"222淘宝开新店了优惠多多，速度购",
                 @"333好吧你又被骗了哈哈, 好笨啊"];
    _currentIndex = 0;
    sHeight = 50;
    sWidth = SCREEN_W -sHeight*3/2;
    scroll = [[UIScrollView alloc] init];
    scroll.frame = CGRectMake(0, 0, sWidth, sHeight);
    scroll.pagingEnabled = YES;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.scrollEnabled = NO;
    [mainview addSubview:scroll];
    
    ttv1 = [[NSBundle mainBundle] loadNibNamed:@"TaoTiaoView" owner:self options:nil].lastObject;
    ttv2 = [[NSBundle mainBundle] loadNibNamed:@"TaoTiaoView" owner:self options:nil].lastObject;
    ttv3 = [[NSBundle mainBundle] loadNibNamed:@"TaoTiaoView" owner:self options:nil].lastObject;
    ttv1.frame = CGRectMake(0, sHeight *0, sWidth, sHeight);
    ttv2.frame = CGRectMake(0, sHeight *1, sWidth, sHeight);
    [scroll addSubview:ttv1];
    [scroll addSubview:ttv2];
    [ttv1 setData:_dataArr[0] str:_dataArr[0]];
    [ttv2 setData:_dataArr[1] str:_dataArr[1]];
    __weak TaoTiaoView *weak_ttv = ttv1;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
        [XunUtils show:[weak_ttv toString]];
    }];
    [scroll addGestureRecognizer:tap];
    
    [scroll setContentSize:CGSizeMake(sWidth, sHeight *2)];
    [scroll setContentOffset:CGPointMake(0, 0) animated:YES];
    
    scroll.delegate = self;
    [self startTimer];
    
    
}

- (void)startTimer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changeNews) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)stopTimer{
    [_timer invalidate];
    _timer = nil;
}

- (void)changeNews {
    [scroll setContentOffset:CGPointMake(0, sHeight) animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scroll.contentOffset.y;
    if (offset >= sHeight) {
        _currentIndex++;
        scroll.contentOffset = CGPointMake(0, 0);
        if (_currentIndex == _dataArr.count-1) {
            [ttv1 setData:_dataArr[_currentIndex]
                      str:_dataArr[_currentIndex ]];
            [ttv2 setData:_dataArr[0]
                      str:_dataArr[0]];
            _currentIndex = -1;
        }else{
            [ttv1 setData:_dataArr[_currentIndex]
                      str:_dataArr[_currentIndex]];
            [ttv2 setData:_dataArr[_currentIndex+1]
                      str:_dataArr[_currentIndex+1]];
        }
    }
}//

@end
