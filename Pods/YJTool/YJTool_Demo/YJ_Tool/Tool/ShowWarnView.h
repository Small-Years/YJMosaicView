//
//  ShowWarnView.h
//  YJTool_Demo
//
//  Created by yangjian on 2018/11/27.
//  Copyright © 2018 zhangshuyue. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ShowWarnView : UIView

/**
    需要展示的View
 */
@property (nonatomic,strong)UIView *centerView;

-(instancetype)initWithFrame:(CGRect)frame;

-(void)show;

-(void)close;
@end


