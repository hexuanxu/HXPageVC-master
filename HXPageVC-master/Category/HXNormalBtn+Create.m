//
//  HXNormalBtn+Create.m
//  HXPageVC-master
//
//  Created by hexuan on 2019/7/30.
//  Copyright © 2019年 hexuan. All rights reserved.
//

#import "HXNormalBtn+Create.h"

@implementation HXNormalBtn (Create)

+ (HXNormalBtn *)createButtonWithFrame:(CGRect)frame target:(id)target selector:(SEL)selector text:(NSString *)buttonStr bgColor:(UIColor *)bgColor titleColor:(UIColor *)titleColor tag:(NSInteger)tag font:(UIFont *)sizeFont{
    
    HXNormalBtn * button = [HXNormalBtn buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setBackgroundImage:[UIImage imageWithColor:bgColor] forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.tag = tag;
    [button setTitle:buttonStr forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button.titleLabel setFont:sizeFont];
    
    
    return button;
    
}


@end
