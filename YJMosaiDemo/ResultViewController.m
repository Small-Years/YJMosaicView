//
//  ResultViewController.m
//  YJMosaiDemo
//
//  Created by yangjian on 2019/1/28.
//  Copyright © 2019 zhangshuyue. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"结果";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [YJAllmethod getLeftBarButtonItemWithSelect:@selector(popRootVC) andTarget:self WithStyle:navigationBarStyle_gray];
    
    UIImageView *resultImgView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 50, SCREEN_WIDTH-80, SCREEN_HEIGHT-100)];
    resultImgView.image = self.resultImage;
    [self.view addSubview:resultImgView];
    
}

-(void)popRootVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
