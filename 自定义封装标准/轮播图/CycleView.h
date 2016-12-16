//
//  CycleView.h
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/16.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreenWidth   [[UIScreen mainScreen] bounds].size.width

#define kCollectionCellMargin   13
@interface CycleView : UIView
- (void)removeNSTimer;
@end
