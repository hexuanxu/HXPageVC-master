//
//  UIImage+Image.h
//  XianYu
//
//  Created by li  bo on 16/5/28.
//  Copyright © 2016年 li  bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

/**
 *  根据颜色生成一张图片
 *  @param color 提供的颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 *  加载图片
 *
 *  @param name 图片名
 */
+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
+(UIImage *)coreBlurImage:(UIImage *)image
           withBlurNumber:(CGFloat)blur;

//+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;


//根据传入的图片,生成一终带有边框的圆形图片.
//borderW边框宽度
//borderColor:边框颜色
//image:要生成的原始图片.
+ (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image;

+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;

+ (UIImage *)imageWithVideoURL: (NSURL *)videoURL enableSave: (BOOL)enableSave;


@end
