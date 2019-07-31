//
//  HXNormalBtn+Create.h
//  HXPageVC-master
//
//  Created by hexuan on 2019/7/30.
//  Copyright © 2019年 hexuan. All rights reserved.
//

#import "HXNormalBtn.h"

@interface HXNormalBtn (Create)

/*创建一个HMHNormalBtn*/

+ (HXNormalBtn *)createButtonWithFrame:(CGRect)frame target:(id)target selector:(SEL)selector text:(NSString *)buttonStr bgColor:(UIColor *)bgColor titleColor:(UIColor *)titleColor tag:(NSInteger)tag font:(UIFont *)sizeFont;


@end
