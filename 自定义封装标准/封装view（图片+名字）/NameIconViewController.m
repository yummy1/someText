//
//  NameIconViewController.m
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/15.
//  Copyright © 2016年 锐拓. All rights reserved.
//
//通过代码创建
//初始化时一定会调用initWithFrame:方法
//
//通过xib\storyboard创建
//初始化时不会调用initWithFrame:方法，只会调用initWithCoder:方法，初始化完毕后会调用awakeFromNib方法注意要在在awakeFromNib中初始化子控件
//建议：自定义UIView时，如果该View一直一个样式，推荐使用xib，简单方便，而子控件经常随着父控件变化而变化，推荐使用纯代码，灵活多变。

#import "NameIconViewController.h"
#import "NameIconView.h"
#import "NameIconModel.h"

@interface NameIconViewController ()

@end

@implementation NameIconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //初始化
    NameIconView *nameIconV = [[NameIconView alloc] init];
    nameIconV.layer.borderColor = [UIColor redColor].CGColor;
    nameIconV.layer.borderWidth = 1;
    //设置数据
    NSDictionary *dic = @{@"name":@"名字", @"icon":@"nameIcon.png"};
    NameIconModel *model = [NameIconModel mj_objectWithKeyValues:dic];
    nameIconV.model = model;
    //设置frame
    nameIconV.frame = CGRectMake(100, 100, 70, 100);
    //添加子控件
    [self.view addSubview:nameIconV];
}

@end
