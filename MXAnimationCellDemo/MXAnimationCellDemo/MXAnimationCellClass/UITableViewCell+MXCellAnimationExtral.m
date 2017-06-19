//
//  UITableViewCell+MXCellAnimationExtral.m
//  TableViewAnimationDemo
//
//  Created by msxf on 2017/6/16.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import "UITableViewCell+MXCellAnimationExtral.h"
#import <objc/runtime.h>

static char const * const AnimationTypeKey = "animationType";
static char const * const IndexPathKey = "indexPath";

@implementation UITableViewCell (MXCellAnimationExtral)

- (void)setType:(MXCellAnimationType)type {
    objc_setAssociatedObject(self, AnimationTypeKey, @(type), OBJC_ASSOCIATION_ASSIGN);
}

- (MXCellAnimationType)type {
    return [objc_getAssociatedObject(self, AnimationTypeKey) integerValue];
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    objc_setAssociatedObject(self, IndexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSIndexPath *)indexPath {
    return objc_getAssociatedObject(self, IndexPathKey);
}

- (void)show {
    switch (self.type) {
        case MXCellAnimationFade:
        {
            self.alpha = 0;
            [UIView animateWithDuration:0.2 delay:self.indexPath.row * 0.05 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        case MXCellAnimationSlideFromLeft:
        {
            self.frame = CGRectMake(-100, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
            self.alpha = 0;
            [UIView animateWithDuration:0.2 delay:self.indexPath.row * 0.1 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
                self.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        case MXCellAnimationSlideFromRight:
        {
            self.frame = CGRectMake(100, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
            self.alpha = 0;
            [UIView animateWithDuration:0.2 delay:self.indexPath.row * 0.1 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
                self.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        case MXCellAnimationExpand:
        {
            self.alpha = 0;
            self.layer.anchorPoint = CGPointMake(1, 0);
            self.layer.transform = CATransform3DRotate(CATransform3DIdentity, M_PI_2 * 0.8, 1, 0, 0);
            [UIView animateWithDuration:0.2 delay:self.indexPath.row * 0.05 options:UIViewAnimationOptionLayoutSubviews animations:^{
                self.alpha = 1;
                self.layer.transform = CATransform3DIdentity;
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
            
        default:
            break;
    }
}

- (void)showAnimationType:(MXCellAnimationType)type indexPath:(NSIndexPath*)indexPath {
    self.type = type;
    self.indexPath = indexPath;
    [self show];
}

@end
