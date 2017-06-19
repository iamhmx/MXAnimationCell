//
//  UITableViewCell+MXCellAnimationExtral.h
//  TableViewAnimationDemo
//
//  Created by msxf on 2017/6/16.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MXCellAnimationType) {
    MXCellAnimationFade,
    MXCellAnimationSlideFromLeft,
    MXCellAnimationSlideFromRight,
    MXCellAnimationExpand
};

@interface UITableViewCell (MXCellAnimationExtral)

@property (assign, nonatomic) MXCellAnimationType type;
@property (strong, nonatomic) NSIndexPath *indexPath;

- (void)show;
- (void)showAnimationType:(MXCellAnimationType)type indexPath:(NSIndexPath*)indexPath;

@end
