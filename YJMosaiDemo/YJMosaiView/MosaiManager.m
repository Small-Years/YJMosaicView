//
//  MosaiManager.m
//  YJMosaiDemo
//
//  Created by yangjian on 2019/1/28.
//  Copyright © 2019 zhangshuyue. All rights reserved.
//

#import "MosaiManager.h"

@interface MosaiManager()

@property(nonatomic,strong)NSMutableArray *cacheArray;
@property(nonatomic,strong)UIImage *originalImage;
@end

@implementation MosaiManager

-(instancetype)initWithOriImage:(UIImage *)originalImage{
    if (!originalImage) return nil;
    if (self = [super init]) {
        _currentIndex = 0;
        _cacheArray = [[NSMutableArray alloc]init];
        [_cacheArray addObject:originalImage];
        _originalImage = originalImage;
    }
    return self;
}


-(UIImage *)redo{
    if (_currentIndex + 1 < _cacheArray.count) {
        _currentIndex++;
        return _cacheArray[_currentIndex];
    }
    return nil;
}

-(UIImage*)undo{
    if (_currentIndex - 1 >= 0) {
        _currentIndex--;
        return _cacheArray[_currentIndex];
    }

    return nil;
}


-(void)writeImageToCache:(UIImage *)image{
    if (!image) return;
    if (_currentIndex < _cacheArray.count -1) {
        [_cacheArray removeObjectsInRange:NSMakeRange(_currentIndex+1 , _cacheArray.count - 1 - _currentIndex)];
    }
    [_cacheArray addObject:image];
    _currentIndex++;
    _operationCount = _currentIndex;
}

-(void)releaseAllImage{
    [self.cacheArray removeAllObjects];
    _currentIndex = 0;
}
@end
