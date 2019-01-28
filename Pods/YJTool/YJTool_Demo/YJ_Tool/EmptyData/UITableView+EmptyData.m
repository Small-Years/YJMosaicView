//
//  UITableView+EmptyData.m
//  拼图
//
//  Created by yangjian on 2017/3/1.
//  Copyright © 2017年 yangjian. All rights reserved.
//

#import "UITableView+EmptyData.h"

@implementation UITableView (EmptyData)

- (void)tableViewDisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount
{
    if (rowCount == 0) {
        // Display a message when the table is empty
        // 没有数据的时候，UILabel的显示样式
        UILabel *messageLabel = [UILabel new];
        
        messageLabel.text = message;
        messageLabel.font = [UIFont systemFontOfSize:20];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        
        [messageLabel sizeToFit];
        
        
        self.backgroundView = messageLabel;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    } else {
        self.backgroundView = nil;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}

-(void)tableViewDisplayWitImageName:(NSString *)imageName ifNecessaryForRowCount:(NSUInteger)rowCount{
    if (rowCount == 0) {
        UIImageView *imageView = [UIImageView new];
        if ([imageName isEqualToString:@""]) {
            imageView.image = [UIImage imageNamed:@"NoData"];
        }else{
            imageView.image = [UIImage imageNamed:imageName];
        }
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.backgroundView = imageView;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    } else {
        self.backgroundView = nil;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}

//-(void)BtnClicked{
//    
//    if ([self.addDelegate respondsToSelector:@selector(addPhotoBtnClidked)]) {
//        [self.addDelegate addPhotoBtnClidked];
//    }
//}


@end
