//
//  MosaiManager.h
//  YJMosaiDemo
//
//  Created by yangjian on 2019/1/28.
//  Copyright © 2019 zhangshuyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MosaiManager : NSObject


-(instancetype)initWithOriImage:(UIImage*)originalImage;

//重做
-(UIImage*)redo;

//撤销
-(UIImage*)undo;

//当前操作数index
@property(nonatomic,assign)NSInteger currentIndex;
//操作数
@property(nonatomic,assign)NSInteger operationCount;

-(void)writeImageToCache:(UIImage*)image;

-(void)releaseAllImage;



@end
