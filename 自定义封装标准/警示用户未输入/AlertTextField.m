//
//  AlertTextField.m
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/15.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import "AlertTextField.h"
@interface AlertTextField()
@property (nonatomic, strong)CAShapeLayer *alertLayer;
@end
@implementation AlertTextField
- (void)createAlertLayer{
    // 设置layer相关属性
    self.alertLayer = [CAShapeLayer layer];
    // 大小和文本框一致
    self.alertLayer.frame = self.bounds;
    // 画线 非圆角
    self.alertLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.alertLayer.bounds cornerRadius:5].CGPath;
    // 线宽
    self.alertLayer.lineWidth = 2. / [[UIScreen mainScreen] scale];
    // 设置为实线
    self.alertLayer.lineDashPattern = nil;
    // 填充颜色透明色
    self.alertLayer.fillColor = [UIColor clearColor].CGColor;
    // 边框颜色为红色
    self.alertLayer.strokeColor = [UIColor redColor].CGColor;
    
    [self.layer addSublayer:self.alertLayer];
}
- (void)showAlert
{
    [self createAlertLayer];
    
    // 透明度变化
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.repeatCount = 5;
    opacityAnimation.repeatDuration = 2;
    opacityAnimation.autoreverses = YES;
    [self.alertLayer addAnimation:opacityAnimation forKey:@"opacity"];
    
    // 2秒后移除动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 2秒后异步执行这里的代码...
        // 移除动画
        [self.alertLayer removeFromSuperlayer];
    });
    
}
@end
