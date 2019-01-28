//
//  ShowWarnView.m
//  YJTool_Demo
//
//  Created by yangjian on 2018/11/27.
//  Copyright © 2018 zhangshuyue. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#import "ShowWarnView.h"
#import "UIView+YJViewExtension.h"

@interface ShowWarnView()<UIGestureRecognizerDelegate>

@property (nonatomic,weak)UIView *blackView;

@property (nonatomic,weak)UIView *contView;
@end

@implementation ShowWarnView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , SCREEN_HEIGHT)];
        bgView.tag = 10;
        bgView.backgroundColor = [UIColor colorWithRed: 0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(close)];
        tap.delegate = self;
        [bgView addGestureRecognizer:tap];
        [self addSubview:bgView];
        self.blackView = bgView;
        
    }
    return self;
}


#pragma mark - setData
-(void)setCenterView:(UIView *)centerView{
    self.contView = centerView;
    [self.blackView addSubview:self.contView];
    self.contView.centerX = self.blackView.width *0.5;
    self.contView.centerY = self.blackView.height *0.5;
}

#pragma mark - ViewMethod
-(void)show{
    self.blackView.alpha = 0;
    self.contView.transform = CGAffineTransformMakeScale(0.1,0.1);
    [UIView animateWithDuration:0.3 animations:^{
        self.contView.transform = CGAffineTransformMakeScale(1.1,1.1);
        self.blackView.alpha = 1;
    } completion:^(BOOL finished) {
        self.contView.transform = CGAffineTransformMakeScale(1,1);
    }];
    
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    [mainWindow addSubview:self];
}

-(void)close{
    [UIView animateWithDuration:0.3 animations:^{
        self.contView.transform = CGAffineTransformMakeScale(0.1,0.1);
        self.blackView.alpha = 0.1;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer.view.tag != 10) {
        return NO;
    }
    return YES;
}


@end
