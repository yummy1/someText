//
//  MoveViewController.m
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/15.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import "MoveViewController.h"
#import "MoveView.h"

@interface MoveViewController ()
@property(nonatomic, strong)MoveView *moveView;
@end

@implementation MoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    MoveView *moveV = [[MoveView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    [self.view addSubview:moveV];
}


@end
