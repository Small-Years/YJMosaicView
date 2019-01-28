//
//  DrawViewController.m
//  YJMosaiDemo
//
//  Created by yangjian on 2019/1/28.
//  Copyright © 2019 zhangshuyue. All rights reserved.
//

#import "DrawViewController.h"
#import "MosaiView.h"
#import "ResultViewController.h"

#define headerViewHeight 45
#define footViewHeight 45

@interface DrawViewController ()<UIScrollViewDelegate,MosaiViewDelegate>{
    
    UIScrollView *mainScrollView;
    
    UIToolbar *headerToolBar;
}

@property (nonatomic,strong)MosaiView * mosaicView;
@end

@implementation DrawViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self createMosaicsView:self.originalImage withFrame:CGRectMake(0, headerViewHeight + 20, SCREEN_WIDTH, SCREEN_HEIGHT - headerViewHeight - footViewHeight-20)];
    
    headerToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, headerViewHeight)];
    UIBarButtonItem *iteml = [[UIBarButtonItem alloc] initWithTitle:@"く" style:UIBarButtonItemStylePlain target:self action:@selector(endDrawPic)];
    iteml.tintColor = RGB(155, 155, 155);
    [iteml setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17],NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    UIBarButtonItem *item_fix1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:nil
                                                                               action:nil];
    
    UIBarButtonItem *item_title = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:nil action:nil];
    item_title.tintColor = RGB(76, 76, 76);
    UIBarButtonItem *item_fix2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                               target:nil
                                                                               action:nil];
    UIBarButtonItem *itemr = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(SaveBtnClicked)];
    itemr.tintColor = RGB(26, 173, 25);
    [headerToolBar setItems:@[iteml,item_fix1,item_title,item_fix2,itemr]];
    [self.view addSubview:headerToolBar];
    
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - footViewHeight, SCREEN_WIDTH, footViewHeight)];
    footView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:footView];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, footView.height)];
    [backBtn setTitle:@"←" forState:UIControlStateNormal];
    backBtn.titleLabel.font = [UIFont systemFontOfSize:25];
    backBtn.showsTouchWhenHighlighted = YES;
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(mosaicBackBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:backBtn];
    
    
    UIButton *goBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    goBtn.frame = CGRectMake(footView.width - 100, 0, 100, footView.height);
    [goBtn setTitle:@"→" forState:UIControlStateNormal];
    goBtn.titleLabel.font = [UIFont systemFontOfSize:25];
    [goBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    goBtn.showsTouchWhenHighlighted = YES;
    [goBtn addTarget:self action:@selector(mosaicGoBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:goBtn];
    
}
-(void)mosaicGoBtnClicked{
    [self.mosaicView redo];
}

-(void)mosaicBackBtnClicked{
    [self.mosaicView undo];
};

-(void)mosaicRedoBtnClicked{
    [self.mosaicView resetMosaiImage];
}

-(void)endDrawPic{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)SaveBtnClicked{
    ResultViewController *vc = [[ResultViewController alloc]init];
    vc.resultImage = self.mosaicView.resultImage;
    [self.navigationController pushViewController:vc animated:YES];
}



/**
 创建马赛克画板

 @param image 原图
 @param frame 画板frame
 */
- (void)createMosaicsView:(UIImage *)image withFrame:(CGRect)frame {
    if (mainScrollView != nil) {
        [mainScrollView removeFromSuperview];
        mainScrollView = nil;
    }
    mainScrollView = [[UIScrollView alloc] initWithFrame:frame];
    
    mainScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.showsVerticalScrollIndicator = NO;
    mainScrollView.delegate = self;
    mainScrollView.clipsToBounds = NO;
    mainScrollView.y = frame.origin.y;
    [self.view addSubview:mainScrollView];
    
    CGFloat img_Width = (image.size.width * mainScrollView.height)/image.size.height;
    CGRect showRect = CGRectMake(0, 0, img_Width, mainScrollView.height);
    if (image.size.width > image.size.height) {
        CGFloat img_Height = (image.size.height * mainScrollView.width)/image.size.width;
        showRect = CGRectMake(0, 0, mainScrollView.width,img_Height);
        showRect.origin.y = (mainScrollView.height - img_Height)*0.5;
    }
    
    
    self.mosaicView = [[MosaiView alloc] initWithFrame:showRect];
    self.mosaicView.centerX = mainScrollView.width * 0.5;
    self.mosaicView.deleagate = self;
    self.mosaicView.originalImage = image;//原图
    self.mosaicView.mosaicImage = image;//马赛克图
    [mainScrollView addSubview:self.mosaicView];
    
    mainScrollView.maximumZoomScale = 2.0;
    mainScrollView.minimumZoomScale = 1;
    mainScrollView.panGestureRecognizer.minimumNumberOfTouches = 2;
    mainScrollView.panGestureRecognizer.delaysTouchesBegan = NO;
    mainScrollView.pinchGestureRecognizer.delaysTouchesBegan = NO;
    
}


#pragma mark -UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.mosaicView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat Ws = mainScrollView.frame.size.width - mainScrollView.contentInset.left - mainScrollView.contentInset.right;
    CGFloat Hs = mainScrollView.frame.size.height - mainScrollView.contentInset.top - mainScrollView.contentInset.bottom;
    CGFloat W = mainScrollView.frame.size.width;
    CGFloat H = mainScrollView.frame.size.height;
    
    CGRect rct = self.mosaicView.frame;
    rct.origin.x = MAX((Ws-W)/2, (SCREEN_WIDTH - self.mosaicView.width)*0.5);
    rct.origin.y = MAX((Hs-H)/2, (mainScrollView.height - self.mosaicView.height)*0.5);
    self.mosaicView.frame = rct;
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
