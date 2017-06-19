//
//  MXAnimationCellManager.m
//  MXAnimationCellDemo
//
//  Created by msxf on 2017/6/19.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import "MXAnimationCellManager.h"

@interface MXAnimationCellManager()

@end

static MXAnimationCellManager *manager;
@implementation MXAnimationCellManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MXAnimationCellManager alloc]init];
    });
    return manager;
}

- (void)show {
    NSArray *cells = self.tableView.visibleCells;
    for (UITableViewCell *cell in cells) {
        switch (self.type) {
            case MXCellAnimationFade:
            {
                cell.alpha = 0;
                [UIView animateWithDuration:0.2 delay:[self currentRow:cell] * 0.05 options:UIViewAnimationOptionLayoutSubviews animations:^{
                    cell.alpha = 1;
                } completion:^(BOOL finished) {
                    
                }];
            }
                break;
                
            case MXCellAnimationSlideFromLeft:
            {
                cell.frame = CGRectMake(-100, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
                cell.alpha = 0;
                [UIView animateWithDuration:0.2 delay:[self currentRow:cell] * 0.1 options:UIViewAnimationOptionLayoutSubviews animations:^{
                    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
                    cell.alpha = 1;
                } completion:^(BOOL finished) {
                    
                }];
            }
                break;
                
            case MXCellAnimationSlideFromRight:
            {
                cell.frame = CGRectMake(100, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
                cell.alpha = 0;
                [UIView animateWithDuration:0.2 delay:[self currentRow:cell] * 0.1 options:UIViewAnimationOptionLayoutSubviews animations:^{
                    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
                    cell.alpha = 1;
                } completion:^(BOOL finished) {
                    
                }];
            }
                break;
                
            case MXCellAnimationExpand:
            {
                cell.alpha = 0;
                //cell.layer.anchorPoint = CGPointMake(1, 0);
                cell.layer.transform = CATransform3DRotate(CATransform3DIdentity, M_PI_2 * 0.8, 1, 0, 0);
                [UIView animateWithDuration:0.2 delay:[self currentRow:cell] * 0.05 options:UIViewAnimationOptionLayoutSubviews animations:^{
                    cell.alpha = 1;
                    //cell.layer.anchorPoint = CGPointMake(0.5, 0.5);
                    cell.layer.transform = CATransform3DIdentity;
                } completion:^(BOOL finished) {
                    
                }];
            }
                break;
                
            default:
                break;
        }
    }
}

- (NSInteger)currentRow:(UITableViewCell*)cell {
    return [self.tableView.visibleCells indexOfObject:cell];
}

@end
