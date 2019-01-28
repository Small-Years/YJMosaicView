//
//  UILabel+createLabel.m
//  YJTool_Demo
//
//  Created by yangjian on 2018/11/27.
//  Copyright © 2018 zhangshuyue. All rights reserved.
//

#import "UILabel+createLabel.h"

@implementation UILabel (createLabel)

+(UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(float)font{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:font];
    label.textColor = textColor;
    return label;
}

@end
