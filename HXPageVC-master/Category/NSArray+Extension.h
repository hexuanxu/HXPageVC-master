//
//  NSArray+Extension.h
//  HXTreasureMaster
//
//  Created by mac on 2017/3/9.
//  Copyright © 2017年 hexuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Extension)

- (id)safeObjectAtIndex:(NSUInteger)index;
- (id)safeSubarrayWithRange:(NSRange)range;
- (id)safeSubarrayFromIndex:(NSUInteger)index;
- (id)safeSubarrayWithCount:(NSUInteger)count;


@end
