//
//  UIView+YJViewExtension.h
//  MJRefreshExample
//
//  Created by MJ Lee on 14-5-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJViewExtension)
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;

@property (assign, nonatomic) CGFloat max_Y;
@property (assign, nonatomic) CGFloat max_X;
@property(nonatomic, assign)CGFloat centerX;
@property(nonatomic, assign)CGFloat centerY;


/**
 *  等比例拉伸视图
 *
 *  @param width 目标宽
 *
 *  @return 目标高
 */
- (CGFloat)autoresizeHeightToWidth:(CGFloat)width;
/**
 *  等比例拉伸视图
 *
 *  @param height 目标高
 *
 *  @return 目标宽
 */
- (CGFloat)autoresizeWidthToHeight:(CGFloat)height;
@end




