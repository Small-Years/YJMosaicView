//
//  MosaiPath.h
//  YJMosaiDemo
//
//  Created by yangjian on 2019/1/28.
//  Copyright © 2019 zhangshuyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PathPoint:NSObject

@property(nonatomic)float xPoint;

@property(nonatomic)float yPoint;

@end


@interface MosaiPath : NSObject

@property(nonatomic)CGPoint startPoint;
@property(nonatomic)NSMutableArray *pathPointArray;
@property(nonatomic)CGPoint endPoint;

-(void)resetStatus;

@end
