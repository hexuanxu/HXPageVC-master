//
//  UIView+Helper.h
//  ECMall
//
//  Created by qqian on 2017/3/5.
//  Copyright © 2017年 QiQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, UIViewHelperLayoutOptions) {
    // conflict with each other
    UIViewHelperLayoutOptionsLeft    = 1 << 0,
    UIViewHelperLayoutOptionsRight   = 1 << 1,
    UIViewHelperLayoutOptionsHCenter = 1 << 2,
    // conflict with each other
    UIViewHelperLayoutOptionsTop     = 1 << 3,
    UIViewHelperLayoutOptionsBottom  = 1 << 4,
    UIViewHelperLayoutOptionsVCenter = 1 << 5,
};

@interface UIView (Helper)

@property (assign, nonatomic) CGFloat	top;
@property (assign, nonatomic) CGFloat	bottom;
@property (assign, nonatomic) CGFloat	left;
@property (assign, nonatomic) CGFloat	right;

@property (assign, nonatomic) CGPoint	offset;
@property (assign, nonatomic) CGPoint	position;

@property (assign, nonatomic) CGFloat	x;
@property (assign, nonatomic) CGFloat	y;
@property (assign, nonatomic) CGFloat	w;
@property (assign, nonatomic) CGFloat	h;

@property (assign, nonatomic) CGFloat	width;
@property (assign, nonatomic) CGFloat	height;
@property (assign, nonatomic) CGSize	size;

@property (assign, nonatomic) CGFloat	centerX;
@property (assign, nonatomic) CGFloat	centerY;
@property (assign, nonatomic) CGPoint	origin;
@property (readonly, nonatomic) CGPoint	boundsCenter;

@property(nonatomic, assign) IBInspectable CGFloat borderWidth;
@property(nonatomic, assign) IBInspectable UIColor *borderColor;
@property(nonatomic, assign) IBInspectable CGFloat cornerRadius;

- (void)rotationAnimationStart;

- (void)rotationAnimationEnd;

- (void)floatWithOptions:(UIViewHelperLayoutOptions)options;
- (void)floatWithOptions:(UIViewHelperLayoutOptions)options margin:(UIEdgeInsets)margin;

- (void)floatInView:(UIView *)view options:(UIViewHelperLayoutOptions)options;
- (void)floatInView:(UIView *)view options:(UIViewHelperLayoutOptions)options margin:(UIEdgeInsets)margin;

- (void)alignToView:(UIView *)view options:(UIViewHelperLayoutOptions)options;
- (void)alignToView:(UIView *)view options:(UIViewHelperLayoutOptions)options margin:(UIEdgeInsets)margin;


////显示
//-(void)showMyView:(void (^)())complete;
//
//- (void)hidenMyView:(void (^)())complete;

- (void)addViewCornerRadius:(CGFloat)Radius;

- (void)addBordW:(CGFloat)bordW borderColor:(UIColor *)borderColor;

- (UIViewController *)viewController;

- (void)addShadowWithColor:(UIColor *)theColor;

@end
