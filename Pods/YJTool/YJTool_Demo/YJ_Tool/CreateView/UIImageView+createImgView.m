//
//  UIImageView+createImgView.m
//  YJTool_Demo
//
//  Created by yangjian on 2018/11/27.
//  Copyright © 2018 zhangshuyue. All rights reserved.
//

#import "UIImageView+createImgView.h"

@implementation UIImageView (createImgView)

+(UIImageView *)imageViewWithFrame:(CGRect)frame image:(UIImage *)image backgroundColor:(UIColor *)backgroundColor{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = image;
    imageView.backgroundColor = backgroundColor;
    return imageView;
}

@end
