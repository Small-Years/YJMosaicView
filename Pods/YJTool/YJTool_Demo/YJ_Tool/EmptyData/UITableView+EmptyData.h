//
//  UITableView+EmptyData.h
//  拼图
//
//  Created by yangjian on 2017/3/1.
//  Copyright © 2017年 yangjian. All rights reserved.
//

#import <UIKit/UIKit.h>
//@protocol addPhotoDelegate <NSObject>
//
//-(void)addPhotoBtnClidked;
//
//@end

@interface UITableView (EmptyData)

- (void)tableViewDisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount;

- (void)tableViewDisplayWitImageName:(NSString *) imageName ifNecessaryForRowCount:(NSUInteger) rowCount;

@end
