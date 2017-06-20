//
//  MXAnimationCellManager.m
//  MXAnimationCellDemo
//
//  Created by msxf on 2017/6/19.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import "MXAnimationCellManager.h"

@interface MXAnimationCellManager()
@property (strong, nonatomic) NSArray *visiableCells;
@property (assign, nonatomic) SEL animateSelector;
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

- (void)setType:(MXCellAnimationType)type {
    _type = type;
    if (type == MXCellAnimationFade) {
        self.animateSelector = @selector(fade:);
    } else if (type == MXCellAnimationSlideFromLeft) {
        self.animateSelector = @selector(slideFromLeft:);
    } else if (type == MXCellAnimationSlideFromRight) {
        self.animateSelector = @selector(slideFromRight:);
    } else if (type == MXCellAnimationExpand) {
        self.animateSelector = @selector(expand:);
    } else if (type == MXCellAnimationRotateCw) {
        self.animateSelector = @selector(rotateCw:);
    } else if (type == MXCellAnimationRotateAnti) {
        self.animateSelector = @selector(rotateAnti:);
    } else if (type == MXCellAnimationCross) {
        
    }
}

- (void)show {
    if (self.type != MXCellAnimationCross) {
        IMP imp = [self methodForSelector:self.animateSelector];
        void (*func)(id, SEL, UITableViewCell*) = (void *)imp;
        for (UITableViewCell *cell in self.visiableCells) {
            //消除performselector may cause a leak警告
            //[self performSelector:self.animateSelector withObject:cell];
            func(self, self.animateSelector, cell);
        }
    } else {
        [self cross];
    }
}

- (void)fade:(UITableViewCell*)cell {
    cell.alpha = 0;
    [UIView animateWithDuration:0.2 delay:[self currentRow:cell] * 0.05 options:UIViewAnimationOptionLayoutSubviews animations:^{
        cell.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)slideFromLeft:(UITableViewCell*)cell {
    cell.frame = CGRectMake(-100, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    cell.alpha = 0;
    [UIView animateWithDuration:0.2 delay:[self currentRow:cell] * 0.1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
        cell.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)slideFromRight:(UITableViewCell*)cell {
    cell.frame = CGRectMake(100, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    cell.alpha = 0;
    [UIView animateWithDuration:0.2 delay:[self currentRow:cell] * 0.1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
        cell.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)expand:(UITableViewCell*)cell {
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

- (void)rotateCw:(UITableViewCell*)cell {
    cell.alpha = 0;
    cell.layer.transform = CATransform3DRotate(CATransform3DIdentity, M_PI_2 * 0.1, 0, 0, -1);
    [UIView animateWithDuration:0.2 delay:[self currentRow:cell] * 0.05 options:UIViewAnimationOptionLayoutSubviews animations:^{
        cell.alpha = 1;
        cell.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)rotateAnti:(UITableViewCell*)cell {
    cell.alpha = 0;
    cell.layer.transform = CATransform3DRotate(CATransform3DIdentity, M_PI_2 * 0.1, 0, 0, 1);
    [UIView animateWithDuration:0.2 delay:[self currentRow:cell] * 0.05 options:UIViewAnimationOptionLayoutSubviews animations:^{
        cell.alpha = 1;
        cell.layer.transform = CATransform3DIdentity;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)cross {
    CGFloat width = self.tableView.frame.size.width;
    for (NSInteger i = 0; i < self.visiableCells.count; i++) {
        UITableViewCell *cell = self.visiableCells[i];
        if (i % 2 == 0) {
            cell.frame = CGRectMake(-width/2, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
        } else {
            cell.frame = CGRectMake(width/2, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
        }
        [UIView animateWithDuration:0.5 animations:^{
            cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
        }];
    }
}

- (NSInteger)currentRow:(UITableViewCell*)cell {
    return [self.tableView.visibleCells indexOfObject:cell];
}

- (NSArray *)visiableCells {
    return self.tableView.visibleCells;
}

@end
