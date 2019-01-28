//
//  UIButton+createBtn.m
//  YJTool_Demo
//
//  Created by yangjian on 2018/11/27.
//  Copyright © 2018 zhangshuyue. All rights reserved.
//

#import "UIButton+createBtn.h"

@implementation UIButton (createBtn)

+(UIButton *)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor image:(UIImage*)image title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(int)fontValue action:(SEL)selector target:(id)target{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = [UIFont systemFontOfSize:fontValue];
    if (backgroundColor) {
        button.backgroundColor = backgroundColor;
    }else{
        button.backgroundColor = [UIColor whiteColor];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }else{
        [button setTitleColor:[UIColor colorWithRed: 76/255.0 green:76/255.0 blue:76/255.0 alpha:1] forState:UIControlStateNormal];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }else{
        [button setTitle:@"" forState:UIControlStateNormal];
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}


@end
