//
//  NameIconView.h
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/15.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NameIconModel;
@interface NameIconView : UIView
// 在这里为了方便，可以自行添加构造方法，方便使用
// 步骤5 提供一个`模型`属性，重写模型属性的set方法
@property (nonatomic, strong) NameIconModel *model;
@end
