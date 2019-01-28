//
//  YJAllmethod.h
//  JKLNEW
//
//  Created by yangjian on 2018/12/11.
//  Copyright © 2018 谢方振. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger{//返回按钮的颜色，白色和灰色
    navigationBarStyle_White,
    navigationBarStyle_gray,
} navigationBarStyle;


/// 边框类型(位移枚举)
typedef NS_ENUM(NSInteger, UIBorderSideType) {
    UIBorderSideTypeAll    = 0, //四边
    UIBorderSideTypeTop    = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft   = 1 << 2,
    UIBorderSideTypeRight  = 1 << 3,
};

/// 阴影类型(位移枚举)
typedef enum : NSUInteger {
    UIShadowSideTypeAll, //四边阴影
    UIShadowSideTypeTop,
    UIShadowSideTypeBottom ,
    UIShadowSideTypeLeft  ,
    UIShadowSideTypeRight  ,
}UIShadowSideType;

@interface YJAllmethod : NSObject

+ (UIBarButtonItem *)getLeftBarButtonItemWithSelect:(SEL)select andTarget:(id )obj WithStyle:(navigationBarStyle)style;


/**
 向textField添加右侧image

 @param textField textField
 @param imageName 图片名称
 */
+(void)setRightViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName;


/**
 给View添加阴影

 @param needView view
 @param shadowColor 阴影颜色
 @param shadowWidth 阴影宽度
 @param shadowType 阴影类型
 */
+ (void)addShadowToView:(UIView *)needView color:(UIColor *)shadowColor shadowWidth:(CGFloat)shadowWidth shadowType:(UIShadowSideType)shadowType;

/**
 添加边框

 @param needView 需要添加边框的view
 @param bordercolor 边框颜色
 @param borderWidth 宽度
 @param borderType  枚举类型
 */
+ (void)addBorderForView:(UIView *)needView color:(UIColor *)bordercolor borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;

@end


