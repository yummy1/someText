//
//  CycleCollectionViewCell.m
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/16.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import "CycleCollectionViewCell.h"

@implementation CycleCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}
@end
