//
//  UIView+MMKit.h
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/15.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HDAnimationType)
{
    HDAnimationOpen,// 动画开启
    HDAnimationClose// 动画关闭
};
@interface UIView (MMKit)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;

/**
 *  给UIView设置某种颜色的虚线边框，宽度1px
 *
 */
- (void)dashedBorderWithColor:(UIColor *)color;
/**
 *  创建有背景图片的view
 *
 *  @param image 背景图片
 *
 *  @return 返回view
 */
+ (UIView *)setBackgroundImage:(UIImage *)image size:(CGSize)size;
#pragma mark - 动画相关
/**
 *  在某个点添加动画
 *
 *  @param point 动画开始的点
 */
- (void)hd_addAnimationAtPoint:(CGPoint)point;

/**
 *  在某个点添加动画
 *
 *  @param point 动画开始的点
 *  @param type  动画的类型
 *  @param animationColor 动画的颜色
 */
- (void)hd_addAnimationAtPoint:(CGPoint)point WithType:(HDAnimationType)type withColor:(UIColor *)animationColor;

/**
 *  在某个点添加动画
 *
 *  @param point 动画开始的点
 *  @param type  动画的类型
 *  @param animationColor 动画的颜色
 *  @param completion 动画结束后的代码快
 */
- (void)hd_addAnimationAtPoint:(CGPoint)point WithType:(HDAnimationType)type withColor:(UIColor *)animationColor completion:(void (^)(BOOL finished))completion;

/**
 *  在某个点添加动画
 *
 *  @param point      动画开始的点
 *  @param duration   动画时间
 *  @param type       动画的类型
 *  @param animationColor      动画的颜色
 *  @param completion 动画结束后的代码快
 */
- (void)hd_addAnimationAtPoint:(CGPoint)point WithDuration:(NSTimeInterval)duration WithType:(HDAnimationType) type withColor:(UIColor *)animationColor completion:(void (^)(BOOL finished))completion;

@end
