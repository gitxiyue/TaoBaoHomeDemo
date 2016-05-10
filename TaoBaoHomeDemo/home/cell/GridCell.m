//
//  GridCell.m
//  DemoOC01
//
//  Created by yunchu on 15/10/16.
//  Copyright (c) 2015年 yunchu. All rights reserved.
//

#import "GridCell.h"

@implementation GridCell
{
    __weak IBOutlet UIView *bgview;
    __weak IBOutlet UIImageView *iv;
    __weak IBOutlet UILabel *titleLab;
    __weak IBOutlet UILabel *flagLab;
}

- (void)awakeFromNib {
    // Initialization code
    iv.clipsToBounds = YES;
    
    bgview.layer.shadowColor =[UIColor blackColor].CGColor;
    bgview.layer.shadowOffset = CGSizeMake(0, 1);
    bgview.layer.shadowOpacity = 0.2;
    bgview.layer.shadowRadius = 10;
}

- (void)setTitle:(NSString *)title {
    titleLab.text = title;
    titleLab.highlightedTextColor = RGB(200, 200, 200);
}

- (void)setImgPath:(NSString *)imgPath {
    iv.image = [UIImage imageNamed:imgPath];
}

- (void)hiddenTitle:(BOOL)hidden {
    titleLab.hidden = hidden;
}

@end
