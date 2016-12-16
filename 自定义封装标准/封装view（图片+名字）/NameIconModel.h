//
//  NameIconModel.h
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/15.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NameIconModel : NSObject
/**
 *  名字
 */
@property (nonatomic, strong)NSString *name;
/**
 *  图片
 */
@property (nonatomic, strong)NSString *icon;

/*现在用MJExtension取代
+ (instancetype)modelWithName:(NSString *)name icon:(NSString *)icon;
- (instancetype)initWithName:(NSString *)name icon:(NSString *)icon;
 */
@end
