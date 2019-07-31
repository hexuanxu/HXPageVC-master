//
//  UIView+Data.m
//  Library
//
//  Created by qqian on 2017/2/28.
//  Copyright © 2017年 QiQ. All rights reserved.
//

#import "UIView+Data.h"
#import <objc/runtime.h>

static const char kUIViewDataKey;

@implementation UIView (Data)

@dynamic data;

- (void)setData:(id)data
{
    [self dataWillChange];
    
    objc_setAssociatedObject(self, &kUIViewDataKey, data, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self dataDidChange];
}

- (id)data
{
    return objc_getAssociatedObject(self, &kUIViewDataKey);
}

- (void)dataWillChange
{

}

- (void)dataDidChange
{

}

@end
