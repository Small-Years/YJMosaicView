//
//  UIButton+createBtn.h
//  YJTool_Demo
//
//  Created by yangjian on 2018/11/27.
//  Copyright © 2018 zhangshuyue. All rights reserved.
//





@interface UIButton (createBtn)

+(UIButton *)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor image:(UIImage*)image title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(int)fontValue action:(SEL)selector target:(id)target;

@end

