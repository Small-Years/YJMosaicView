//
//  YJAllmethod.m
//  JKLNEW
//
//  Created by yangjian on 2018/12/11.
//  Copyright © 2018 谢方振. All rights reserved.
//

#import "YJAllmethod.h"
#import "UIView+YJViewExtension.h"

@implementation YJAllmethod

+ (UIBarButtonItem *)getLeftBarButtonItemWithSelect:(SEL)select andTarget:(id )obj WithStyle:(navigationBarStyle)style{
    //返回
    UIButton* backButton= [[UIButton alloc] initWithFrame:CGRectMake(0,0,26,50)];
    backButton.contentMode=UIViewContentModeCenter;
    if (style == navigationBarStyle_gray) {
        [backButton setImage:[UIImage imageNamed:@"leftImage_Gray"] forState:UIControlStateNormal];
    }else{
        [backButton setImage:[UIImage imageNamed:@"leftImage_White"] forState:UIControlStateNormal];
    }
    
    backButton.titleLabel.font=[UIFont systemFontOfSize:13];
    [backButton addTarget:obj action:select forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    return item;
}


+(void)addShadowToView:(UIView *)needView color:(UIColor *)shadowColor shadowWidth:(CGFloat)shadowWidth shadowType:(UIShadowSideType)shadowType{
    
    needView.layer.shadowColor = shadowColor.CGColor;
    needView.layer.shadowOffset = CGSizeMake(0,0);
    needView.layer.shadowOpacity = 0.5;
    needView.layer.shadowRadius = shadowWidth;
    if (shadowType == UIShadowSideTypeAll) {
        return;
    }
    
    CGRect shadowRect;
    if (shadowType == UIShadowSideTypeTop){
        shadowRect = CGRectMake(0, 0, needView.bounds.size.width, shadowWidth);
    }else if (shadowType == UIShadowSideTypeLeft){
        shadowRect = CGRectMake(-shadowWidth, 0, shadowWidth, needView.bounds.size.height);
    }else if (shadowType == UIShadowSideTypeBottom){
        shadowRect = CGRectMake(0, needView.bounds.size.height - shadowWidth*0.5, needView.bounds.size.width, shadowWidth);
    }else{
        shadowRect = CGRectMake(needView.bounds.size.width-shadowWidth *0.5, 0, shadowWidth,needView.bounds.size.height);
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:shadowRect];
    needView.layer.shadowPath = path.CGPath;
}


// 给textField添加右侧image
+(void)setRightViewWithTextField:(UITextField *)textField imageName:(NSString *)imageName{
    UIImageView *rightView = [[UIImageView alloc]init];
    rightView.image = [UIImage imageNamed:imageName];
    rightView.size = CGSizeMake(textField.bounds.size.height, textField.bounds.size.height);
    rightView.contentMode = UIViewContentModeCenter;
    textField.rightView = rightView;
    textField.rightViewMode = UITextFieldViewModeAlways;
}


/**
 设置view指定位置的边框
 @param needView   原view
 @param bordercolor          边框颜色
 @param borderWidth    边框宽度
 @param borderType     边框类型 例子: UIBorderSideTypeTop|UIBorderSideTypeBottom
 */
+ (void)addBorderForView:(UIView *)needView color:(UIColor *)bordercolor borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType{
    
    if (borderType == UIBorderSideTypeAll) {
        needView.layer.borderWidth = borderWidth;
        needView.layer.borderColor = bordercolor.CGColor;
    }
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    /// 左侧
    if (borderType & UIBorderSideTypeLeft) {
        /// 左侧线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, needView.frame.size.height)];
        [bezierPath addLineToPoint:CGPointMake(0.0f, 0.0f)];
    }
    
    /// 右侧
    if (borderType & UIBorderSideTypeRight) {
        /// 右侧线路径
        [bezierPath moveToPoint:CGPointMake(needView.frame.size.width, 0.0f)];
        [bezierPath addLineToPoint:CGPointMake( needView.frame.size.width, needView.frame.size.height)];
    }
    
    /// top
    if (borderType & UIBorderSideTypeTop) {
        /// top线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, 0.0f)];
        [bezierPath addLineToPoint:CGPointMake(needView.frame.size.width, 0.0f)];
    }
    
    /// bottom
    if (borderType & UIBorderSideTypeBottom) {
        /// bottom线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, needView.frame.size.height)];
        [bezierPath addLineToPoint:CGPointMake( needView.frame.size.width, needView.frame.size.height)];
    }
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = bordercolor.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    [needView.layer addSublayer:shapeLayer];
}


@end
