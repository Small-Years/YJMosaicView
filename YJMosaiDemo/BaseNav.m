//
//  BaseNav.m
//  YJMosaiDemo
//
//  Created by yangjian on 2019/1/28.
//  Copyright © 2019 zhangshuyue. All rights reserved.
//

#import "BaseNav.h"

@interface BaseNav ()

@end

@implementation BaseNav

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
}

///重写push方法 push的控制器隐藏tabbar

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    // 隐藏tabbar
    viewController.hidesBottomBarWhenPushed = YES;
    
    [super pushViewController:viewController animated:animated];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
