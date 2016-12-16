//
//  AlertViewController.m
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/15.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import "AlertViewController.h"
#import "AlertTextField.h"
@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 创建一个AlertTextField
    AlertTextField *textField = [[AlertTextField alloc]initWithFrame:CGRectMake(50, 100, 200, 30)];
    textField.placeholder = @"请输入用户名";
    textField.tag = 100;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:textField];
    [textField becomeFirstResponder];
    
    // 创建一个button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 150, 100, 30);
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showAlert{
    AlertTextField *textField = [self.view viewWithTag:100];
    [textField showAlert];
}
@end
