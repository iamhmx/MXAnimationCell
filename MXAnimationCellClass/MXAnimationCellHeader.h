//
//  MXAnimationCellHeader.h
//  MXAnimationCellDemo
//
//  Created by msxf on 2017/6/19.
//  Copyright © 2017年 yellow. All rights reserved.
//

#ifndef MXAnimationCellHeader_h
#define MXAnimationCellHeader_h

//weakSelf & strongSelf
#define MXWeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define MXStrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

typedef NS_ENUM(NSUInteger, MXCellAnimationType) {
    MXCellAnimationFade,
    MXCellAnimationSlideFromLeft,
    MXCellAnimationSlideFromRight,
    MXCellAnimationExpand
};

#endif /* MXAnimationCellHeader_h */
