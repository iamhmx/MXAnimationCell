//
//  MXAnimationCellManager.h
//  MXAnimationCellDemo
//
//  Created by yellow on 2017/6/19.
//  Copyright © 2017年 yellow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MXAnimationCellHeader.h"
#import <UIKit/UIKit.h>

@interface MXAnimationCellManager : NSObject

@property (strong, nonatomic) UITableView *tableView;
@property (assign, nonatomic) MXCellAnimationType type;

+ (instancetype)shareInstance;

- (void)show;

@end
