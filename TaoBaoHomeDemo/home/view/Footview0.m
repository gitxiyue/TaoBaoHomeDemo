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
    CGFloat sHeight;
}
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger currentIndex;
@property (strong, nonatomic) NSArray *dataArr;

@end

@implementation Footview0

- (void)awakeFromNib {
    // Initialization code
    
    _currentIndex = 0;
    
    sHeight = 50;
    scroll = [[UIScrollView alloc] init];
    scroll.frame = CGRectMake(0, 0, 200, sHeight);
    scroll.pagingEnabled = YES;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    [mainview addSubview:scroll];
    
    ttv1 = [[NSBundle mainBundle] loadNibNamed:@"TaoTiaoView" owner:self options:nil].lastObject;
    ttv2 = [[NSBundle mainBundle] loadNibNamed:@"TaoTiaoView" owner:self options:nil].lastObject;
    ttv3 = [[NSBundle mainBundle] loadNibNamed:@"TaoTiaoView" owner:self options:nil].lastObject;
    ttv1.frame = CGRectMake(0, sHeight *0, 200, sHeight);
    ttv2.frame = CGRectMake(0, sHeight *1, 200, sHeight);
    ttv3.frame = CGRectMake(0, sHeight *2, 200, sHeight);
    [scroll addSubview:ttv1];
    [scroll addSubview:ttv2];
    [scroll addSubview:ttv3];
    
    [scroll setContentSize:CGSizeMake(200, sHeight *3)];
    [scroll setContentOffset:CGPointMake(0, sHeight) animated:YES];
    
    scroll.delegate = self;
    [self startTimer];
    
    
}

- (void)layoutSubviews {
    XunLog(@"%@", NSStringFromCGRect(mainview.frame));
}

- (void)startTimer{
    _dataArr = @[@"尼玛xx门又出现了啊，为什么没有我啊", @"淘宝开新店了优惠多多，速度购", @"好吧你又被骗了哈哈, 好笨啊", @"hahahahhahahahahahha"];
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
    //XunLog(@"滚动%zd", _currentIndex);
    [scroll setContentOffset:CGPointMake(0, sHeight *2) animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scroll.contentOffset.y;
    if (offset >= sHeight*2) {
        _currentIndex++;
        scroll.contentOffset = CGPointMake(0, sHeight);
        if (_currentIndex == _dataArr.count-1) {
            [ttv1 setData:_dataArr[_currentIndex -1] str:_dataArr[_currentIndex -1]];
            [ttv2 setData:_dataArr[_currentIndex] str:_dataArr[_currentIndex]];
            [ttv3 setData:_dataArr.firstObject str:_dataArr.firstObject];
            _currentIndex = -1;
        }else if (_currentIndex == _dataArr.count) {
            [ttv1 setData:_dataArr.lastObject str:_dataArr.lastObject];
            [ttv2 setData:_dataArr.firstObject str:_dataArr.firstObject];
            [ttv3 setData:_dataArr[1] str:_dataArr[1]];
            _currentIndex = 0;
        }else if (_currentIndex == 0){
            [ttv1 setData:_dataArr.lastObject str:_dataArr.lastObject];
            [ttv2 setData:_dataArr[_currentIndex] str:_dataArr[_currentIndex]];
            [ttv3 setData:_dataArr[_currentIndex+1] str:_dataArr[_currentIndex+1]];
        }else{
            [ttv1 setData:_dataArr[_currentIndex -1] str:_dataArr[_currentIndex -1]];
            [ttv1 setData:_dataArr.firstObject str:_dataArr.firstObject];
            [ttv2 setData:_dataArr[1] str:_dataArr[1]];
            _currentIndex = 0;
        }
    }
    if (offset <= 0) {
        _currentIndex--;
        scroll.contentOffset = CGPointMake(0, sHeight);
        if (_currentIndex == -2) {
            _currentIndex = _dataArr.count-2;
            [ttv1 setData:_dataArr[_dataArr.count-1] str:_dataArr[_dataArr.count-1]];
            [ttv2 setData:_dataArr[_currentIndex] str:_dataArr[_currentIndex]];
            [ttv3 setData:_dataArr.firstObject str:_dataArr.firstObject];
            
        }else if (_currentIndex == -1) {
            _currentIndex = _dataArr.count-1;
            [ttv1 setData:_dataArr[_currentIndex-1] str:_dataArr[_currentIndex-1]];
            [ttv2 setData:_dataArr[_currentIndex] str:_dataArr[_currentIndex]];
            [ttv3 setData:_dataArr.firstObject str:_dataArr.firstObject];
        }else if (_currentIndex == 0){
            [ttv1 setData:_dataArr.lastObject str:_dataArr.lastObject];
            [ttv2 setData:_dataArr[_currentIndex] str:_dataArr[_currentIndex]];
            [ttv3 setData:_dataArr[_currentIndex+1] str:_dataArr[_currentIndex+1]];
        }else{
            [ttv1 setData:_dataArr[_currentIndex-1] str:_dataArr[_currentIndex-1]];
            [ttv2 setData:_dataArr[_currentIndex] str:_dataArr[_currentIndex]];
            [ttv3 setData:_dataArr[_currentIndex+1] str:_dataArr[_currentIndex+1]];
        }
    }
}//

@end
