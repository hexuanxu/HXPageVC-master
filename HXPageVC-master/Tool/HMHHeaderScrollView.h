//
//  FLMallHeaderView.h
//  FLFightingLivePlatform
//
//  Created by 何旋 on 2019/6/15.
//  Copyright © 2019年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HMHHeaderScrollView;

@protocol HMHHeaderScrollViewDelegate <NSObject>

- (void)checkView:(HMHHeaderScrollView *)checkView didSelectBtn:(HXNormalBtn *)button;

@end

@interface HMHHeaderScrollView : UIView

//设置线条颜色
@property(nonatomic,strong)UIColor *lineViewColor;
//设置选中文字颜色
@property(nonatomic,strong)UIColor *disabledTitleColor;
//设置默认文字颜色
@property(nonatomic,strong)UIColor *normalTitleColor;
//设置选中文字字体
@property(nonatomic,strong)UIFont *disabledTitleFont;
//设置文字默认字体
@property(nonatomic,strong)UIFont *normalTitleFont;

//初始化滚动试图的有效宽度
- (instancetype)initWithMaxWidth:(CGFloat)maxWidth;

//外界因数影响 更新选中按钮
- (void)updateSelectedBtnIndex:(NSInteger)index;

@property(nonatomic,weak) id <HMHHeaderScrollViewDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
