//
//  CycleViewController.m
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/16.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import "CycleViewController.h"
#import "CycleView.h"
#define kScreenWidth   [[UIScreen mainScreen] bounds].size.width
@interface CycleViewController ()

@end

@implementation CycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CycleView *cycleView = [[CycleView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, kScreenWidth*0.6)];
    [self.view addSubview:cycleView];
}


@end
