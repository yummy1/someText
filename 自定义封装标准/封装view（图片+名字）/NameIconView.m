//
//  NameIconView.m
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/15.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import "NameIconView.h"
#import "NameIconModel.h"

@interface NameIconView ()
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *nameLabel;
@end
@implementation NameIconView
#pragma mark 添加子控件
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 注意：该处不要给子控件设置frame与数据，可以在这里初始化子控件的属性
        UIImageView *iconImageView = [[UIImageView alloc] init];
        self.iconImageView = iconImageView;
        [self addSubview:iconImageView];
        
        UILabel *nameLabel = [[UILabel alloc] init];
        // 设置子控件的属性
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.font = [UIFont systemFontOfSize:10];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
    }
    return self;
}
#pragma mark 设置frame
- (void)layoutSubviews
{
    [super layoutSubviews];
//    CGFloat iconImageViewX = 0;
//    CGFloat iconImageViewY = 0;
//    CGFloat iconImageViewW = self.bounds.size.width;
//    CGFloat iconImageViewH = self.height*0.8;
//    self.iconImageView.frame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH);
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.width, self.height*0.8));
    }];
    
//    CGFloat nameLabelX = 0;
//    CGFloat nameLabelY = iconImageViewH;
//    CGFloat nameLabelW = iconImageViewW;
//    CGFloat nameLabelH = self.height*0.2;
//    self.nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImageView.mas_bottom);
        make.left.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.width, self.height*0.2));
    }];
}
- (void)setModel:(NameIconModel *)model
{
    _model = model;
    
    self.iconImageView.image = [UIImage imageNamed:model.icon];
    self.nameLabel.text = model.name;
}
@end
