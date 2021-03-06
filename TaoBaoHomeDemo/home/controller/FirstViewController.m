//
//  FirstViewController.m
//  TaoBaoHomeDemo
//
//  Created by xun on 16/5/10.
//  Copyright © 2016年 xun. All rights reserved.
//

#import "FirstViewController.h"
#import "YYFPSLabel.h"
#import "GridCell.h"
#import "GridCell2.h"
#import "GridCell3.h"
#import "Headview1.h"
#import "Headview2.h"
#import "Headview3.h"
#import "Footview0.h"
#import "Footview1.h"


#import "Cell1.h"
#import "HotShiChangCell.h"
#import "DaRenTaoCell.h"

//cell等比高
#define cell_height(i) SCREEN_W*((i)/375.0f)

@interface FirstViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong) UICollectionView *grid;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSArray *sectionArr;

@property (nonatomic, strong) UILabel *msgLab;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpView];
    [self initData];
}

- (void)setUpView {
    self.title = @"首页";
    YYFPSLabel *fps = [YYFPSLabel new];
    self.navigationItem.titleView = fps;
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    UIBarButtonItem *leftI = [[UIBarButtonItem alloc] initWithTitle:@"扫一扫" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonClick)];
    self.navigationItem.leftBarButtonItem  = leftI;
    UIBarButtonItem *rightI = [[UIBarButtonItem alloc] initWithTitle:@"消息" style:UIBarButtonItemStyleDone target:self action:@selector(rightButtonClick)];
    self.navigationItem.rightBarButtonItem = rightI;
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    //layout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
    //layout.headerReferenceSize = CGSizeMake(320, 40);
    _grid = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.view addSubview:_grid];
    
    _grid.backgroundColor = RGBA(245, 245, 245, 1);
    _grid.delegate = self;
    _grid.dataSource = self;
    //[grid setAccessibilityElements:nil];
    [_grid registerNib:[UINib nibWithNibName:@"GridCell" bundle:nil] forCellWithReuseIdentifier:@"GridCell"];
    [_grid registerNib:[UINib nibWithNibName:@"GridCell2" bundle:nil] forCellWithReuseIdentifier:@"GridCell2"];
    [_grid registerNib:[UINib nibWithNibName:@"GridCell3" bundle:nil] forCellWithReuseIdentifier:@"GridCell3"];
    
    [_grid registerNib:[UINib nibWithNibName:@"Cell1" bundle:nil] forCellWithReuseIdentifier:@"Cell1"];
    [_grid registerNib:[UINib nibWithNibName:@"HotShiChangCell" bundle:nil] forCellWithReuseIdentifier:@"HotShiChangCell"];
    [_grid registerNib:[UINib nibWithNibName:@"DaRenTaoCell" bundle:nil] forCellWithReuseIdentifier:@"DaRenTaoCell"];
    
    [_grid registerNib:[UINib nibWithNibName:@"Headview1" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headview1"];
    [_grid registerNib:[UINib nibWithNibName:@"Headview2" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headview2"];
    [_grid registerNib:[UINib nibWithNibName:@"Headview3" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headview3"];
    
    [_grid registerNib:[UINib nibWithNibName:@"Footview0" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footview0"];
    [_grid registerNib:[UINib nibWithNibName:@"Footview1" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footview1"];
}

- (void)initData {
    _dataArr    = [NSArray new];
    _sectionArr = [NSArray new];
}

- (void)leftButtonClick {
    
}

- (void)rightButtonClick {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    if (section == 1) {
        return 6;
    }
    if (section == 2) {
        return 4;
    }
    if (section == 3) {
        return 10;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0) {
        GridCell3 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridCell3" forIndexPath:indexPath];
        gridcell = cell;
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0){
            Cell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell1" forIndexPath:indexPath];
            gridcell = cell;
        }
        else if (indexPath.row == 1) {
            Cell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell1" forIndexPath:indexPath];
            gridcell = cell;
        }
        else if (indexPath.row == 2) {
            Cell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell1" forIndexPath:indexPath];
            gridcell = cell;
        }
        else if (indexPath.row == 3) {
            Cell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell1" forIndexPath:indexPath];
            gridcell = cell;
        }
        else if (indexPath.row == 4) {
            HotShiChangCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HotShiChangCell" forIndexPath:indexPath];
            gridcell = cell;
        }
        else if (indexPath.row == 5) {
            DaRenTaoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DaRenTaoCell" forIndexPath:indexPath];
            gridcell = cell;
        }else {
            
        }
    }
    else if (indexPath.section == 2) {
        GridCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridCell2" forIndexPath:indexPath];
        gridcell = cell;
    }
    else {
        //可以加载更多的那个cell
        GridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridCell" forIndexPath:indexPath];
        gridcell = cell;
    }
    return gridcell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    if (indexPath.section == 0) {
        if (kind == UICollectionElementKindSectionHeader){
            
            Headview1 *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headview1" forIndexPath:indexPath];
            reusableview = headerView;
        }
        if (kind == UICollectionElementKindSectionFooter) {
            Footview0 *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footview0" forIndexPath:indexPath];
            reusableview = footview;
        }
    }else if (indexPath.section == 2) {
        if (kind == UICollectionElementKindSectionHeader){
            
            Headview2 *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headview2" forIndexPath:indexPath];
            reusableview = headerView;
        }
    }else if (indexPath.section == 3) {
        if (kind == UICollectionElementKindSectionHeader){
            
            Headview3 *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headview3" forIndexPath:indexPath];
            reusableview = headerView;
        }
        if (kind == UICollectionElementKindSectionFooter) {
            Footview1 *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footview1" forIndexPath:indexPath];
            reusableview = footview;
        }
    }
    return reusableview;
}

//item 宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {//9宫格组
        //减1去除误差
        //XunLog(@"########%f", (SCREEN_W-4-4-1)/5;
        return CGSizeMake((SCREEN_W-4-4-1)/5 , SCREEN_W/5 + 20);
    }
    if (indexPath.section == 1) {//乱七八糟组
        if (indexPath.row == 0) {
            return CGSizeMake(SCREEN_W, cell_height(190)+8);
        }
        if (indexPath.row == 4) {
            return CGSizeMake(SCREEN_W, 8+30+1+120+1+70 +2*101);
        }
        if (indexPath.row == 5) {
            return CGSizeMake(SCREEN_W, (SCREEN_W-32)/3 +8+30+8+42+40);
        }
        return CGSizeMake(SCREEN_W, cell_height(190)+8);
    }
    if (indexPath.section == 2) {//喜欢组
        return CGSizeMake(SCREEN_W/2-4/2, (SCREEN_W/2-4/2)*2/3 +48);
    }
    if (indexPath.section == 3) {//推荐组
        return CGSizeMake(SCREEN_W/2-4/2, SCREEN_W/2-4/2 +80);
    }
    return CGSizeMake(0, 0);
}

//head 宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(SCREEN_W, SCREEN_W/4); //图片滚动的宽高
    }
    if (section == 2) {
        return CGSizeMake(SCREEN_W, 50);    //猜你喜欢的宽高
    }
    if (section == 3) {
        return CGSizeMake(SCREEN_W, 35);    //推荐适合的宽高
    }
    return CGSizeMake(0, 0);
}

//foot 宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(SCREEN_W, 50);  //淘宝头条的宽高
    }
    if (section == 3) {
        return CGSizeMake(SCREEN_W, 110); //最底部view的宽高
    }
    return CGSizeZero;
}

//边缘间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return UIEdgeInsetsMake(2.0f, 2.0f, 2.0f, 2.0f);
    }
    return UIEdgeInsetsZero;
}

//x 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

//y 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 0;
    }
    if (section == 2) {
        return 4;
    }
    return 2;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return;
    }
    [self show:[NSString stringWithFormat:@"你选择的是%zd，%zd", indexPath.section, indexPath.row]];
    XunLog(@"你选择的是%zd，%zd", indexPath.section, indexPath.row);
}

- (void)show:(nullable NSString *)msg {
    if (_msgLab) {
        return;
    }
    _msgLab = [[UILabel alloc] initWithFrame:CGRectMake(0, -64, SCREEN_W, 64)];
    _msgLab.backgroundColor = RGBA(0, 0, 0, 0.6);
    _msgLab.text = msg;
    _msgLab.textColor = [UIColor whiteColor];
    _msgLab.font = [UIFont boldSystemFontOfSize:18];
    _msgLab.textAlignment = NSTextAlignmentCenter;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_msgLab];
    
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = _msgLab.frame;
        frame.origin.y = 0;
        _msgLab.frame = frame;
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_msgLab removeFromSuperview];
        _msgLab = nil;
    });
}

@end
