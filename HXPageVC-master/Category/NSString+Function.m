//
//  NSString+Function.m
//  HXPageVC-master
//
//  Created by hexuan on 2019/7/30.
//  Copyright © 2019年 hexuan. All rights reserved.
//

#import "NSString+Function.h"

@implementation NSString (Function)

//
- (CGSize)sizeFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
}

@end
