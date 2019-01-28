//
//  ViewController.m
//  YJMosaiDemo
//
//  Created by yangjian on 2019/1/25.
//  Copyright © 2019 zhangshuyue. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVMediaFormat.h>
#import<AVFoundation/AVCaptureDevice.h>
#import<AssetsLibrary/AssetsLibrary.h>
#import<CoreLocation/CoreLocation.h>

#import "DrawViewController.h"
@interface ViewController ()<UIAlertViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 55)];
    btn.center = self.view.center;
    [btn setTitle:@"选择照片" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(startBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = RGB(126, 185, 255);
    [self.view addSubview:btn];
    
    
}

-(void)startBtnClicked{
    //相机权限
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus ==AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
    {
        NSString *errorStr = @"摄像头被禁用，您可在 设置-隐私-相机 中开启健康乐的相机使用权限";
        [WSProgressHUD showErrorWithStatus:errorStr];
        return;
    }
    //相册权限
    
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == kCLAuthorizationStatusRestricted || author ==kCLAuthorizationStatusDenied){
        
        NSString *errorStr = @"相册被禁用，您可在 设置-隐私-照片 中开启健康乐的相册使用权限";
        [WSProgressHUD showErrorWithStatus:errorStr];
        return;
        
    }
    
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"选择图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册", nil];
    sheet.tag = 2550;
    //显示消息框
    [sheet showInView:self.view];
    
}

#pragma mark - actionsheet
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIImagePickerController *imagePick = [[UIImagePickerController alloc] init];
            [self presentViewController:imagePick animated:YES completion:^{
                
                BOOL iscamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
                if (!iscamera) {
                    NSLog(@"没有摄像头");
                    return ;
                }
                imagePick.delegate = self;
                imagePick.sourceType = UIImagePickerControllerSourceTypeCamera;
                imagePick.allowsEditing = YES;
                
            }];
        }
        else
        {
            NSLog(@"没有可用的相机");
        }
    }
    else if (buttonIndex==1)
    {
        UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
        // 设置选择控制器的来源：相册集
        ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        ipc.delegate = self;
        ipc.allowsEditing = NO;
        
        [self presentViewController:ipc animated:YES completion:nil];
    }
}


#pragma mark - UIImagePickerControllerDelegate
// 当用户选择一张图片的时候调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    // 获取选中的照片
    UIImage *imageP = info[UIImagePickerControllerOriginalImage];
    
    DrawViewController *drawVC = [[DrawViewController alloc]init];
    drawVC.originalImage = imageP;
    [self.navigationController pushViewController:drawVC animated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
