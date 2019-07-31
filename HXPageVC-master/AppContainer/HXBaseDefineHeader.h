//
//  HXBaseDefineHeader.h
//  HXPageVC-master
//
//  Created by hexuan on 2019/7/30.
//  Copyright © 2019年 hexuan. All rights reserved.
//

#ifndef HXBaseDefineHeader_h
#define HXBaseDefineHeader_h


//解决弱引用
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//屏幕宽度
#define kDeviceWidth [UIScreen mainScreen].bounds.size.width

//屏幕高度
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

//判断是否是ipad
#define isIPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define iPhoneXSeries (([[UIApplication sharedApplication] statusBarFrame].size.height == 44.0f) ? (YES):(NO))

//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isIPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isIPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isIPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isIPad : NO)

//iPhoneX系列
#define kStausHeight ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 44.0 : 20.0)

#define kNavHeight ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)

#define HMH_TabbarHeight ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0)


//px转pt大小 375 667
//基于宽度
#define k1(px)        px/375.f
#define kpt(px)       k1(px)*kDeviceWidth
//基于高度
#define k2(px)        px/667.f
#define kph(px)       k2(px)*kDeviceHeight

//字体
#define kWordFont(px)     sqrt(kpt(px)*kph(px))

//UIFont
#define KFont(px) [UIFont systemFontOfSize:kWordFont(px)]




#endif /* HXBaseDefineHeader_h */
