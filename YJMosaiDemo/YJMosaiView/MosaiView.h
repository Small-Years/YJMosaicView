//
//  MosaiView.h
//  YJMosaiDemo
//
//  Created by yangjian on 2019/1/28.
//  Copyright © 2019 zhangshuyue. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MosaiViewDelegate;
@interface MosaiView : UIView

//底图为马赛克图
@property (nonatomic, strong) UIImage *mosaicImage;
//表图为正常图片
@property (nonatomic, strong) UIImage *originalImage;
//OperationCount
@property (nonatomic, assign, readonly) NSInteger operationCount;
//CurrentIndex
@property (nonatomic, assign, readonly) NSInteger currentIndex;
//Delegate
@property (nonatomic, weak) id<MosaiViewDelegate> deleagate;

//ResetMosai
-(void)resetMosaiImage;

//下一步
-(void)redo;

//上一步
-(void)undo;

-(BOOL)canUndo;

-(BOOL)canRedo;

-(UIImage*)resultImage;

@end


@protocol MosaiViewDelegate<NSObject>

@optional

-(void)mosaiView:(MosaiView*)view TouchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

-(void)mosaiView:(MosaiView*)view TouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

-(void)mosaiView:(MosaiView*)view TouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
