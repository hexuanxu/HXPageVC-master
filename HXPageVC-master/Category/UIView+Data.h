//
//  UIView+Data.h
//  Library
//
//  Created by qqian on 2017/2/28.
//  Copyright © 2017年 QiQ. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
    给分类添加属性
 */
@interface UIView (Data)

@property (nonatomic, strong) id data;

- (void)dataWillChange;

- (void)dataDidChange;




@end
