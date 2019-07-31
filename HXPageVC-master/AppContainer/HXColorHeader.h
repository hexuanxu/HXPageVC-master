//
//  HXColorHeader.h
//  HXPageVC-master
//
//  Created by hexuan on 2019/7/30.
//  Copyright © 2019年 hexuan. All rights reserved.
//

#ifndef HXColorHeader_h
#define HXColorHeader_h

//设置颜色
#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(rgbValue & 0x0000FF))/255.0 alpha:alphaValue]


//随机色
#define HXRandomColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0]


//RGB颜色
#define HXColor(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]

//线条颜色
#define HMHLineBgColor  HXColor(222, 222, 222)


//主题色
#define ThemeBgColor UIColorFromRGBA(0xFF1500,1.0)


#define HXTitleBgColor HXColor(89, 89, 89)

#define HXLitleTitleBgColor HXColor(135, 135, 135)

#endif /* HXColorHeader_h */
