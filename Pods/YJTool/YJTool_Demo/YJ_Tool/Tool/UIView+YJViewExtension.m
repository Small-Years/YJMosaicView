//
//  UIView+YJViewExtension.m
//  MJRefreshExample
//
//  Created by MJ Lee on 14-5-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIView+YJViewExtension.h"

@implementation UIView (YJViewExtension)
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

-(CGFloat)max_X{
    return self.frame.origin.x+self.frame.size.width;
}
-(CGFloat)max_Y{
    return self.frame.origin.y+self.frame.size.height;
}
-(void)setMax_X:(CGFloat)max_X{
    CGRect frame = self.frame;
    frame.origin.x = max_X - frame.size.width;
    self.frame = frame;
}
-(void)setMax_Y:(CGFloat)max_Y{
    CGRect frame = self.frame;
    frame.origin.y = max_Y - frame.size.height;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

-(void)setCenterX:(CGFloat)centerX
{
    CGPoint point = self.center;
    point.x = centerX;
    self.center = point;
}

-(CGFloat)centerX
{
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY
{
    CGPoint point = self.center;
    point.y = centerY;
    self.center = point;
}

-(CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)autoresizeHeightToWidth:(CGFloat)width {
    if (width == 0 || self.width == 0) {
        return 0;
    }
    CGFloat ratio = self.width / width;
    CGFloat height = self.height / ratio;
    self.size = CGSizeMake(width, height);
    return height;
}

- (CGFloat)autoresizeWidthToHeight:(CGFloat)height {
    if (height == 0 || self.height == 0) {
        return 0;
    }
    CGFloat ratio = self.height / height;
    CGFloat width = self.width / ratio;
    self.size = CGSizeMake(width, height);
    return width;
}

@end
