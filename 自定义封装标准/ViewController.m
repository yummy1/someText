//
//  ViewController.m
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/15.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import "ViewController.h"
#import "NameIconViewController.h"
#import "AlertViewController.h"
#import "MoveViewController.h"
#import "CycleViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray *dataArr;
@end

@implementation ViewController

- (NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = @[@"封装view带图片和文字", @"输入框未输入警示", @"随手指移动的红点view", @"轮播图"];
    }
    return _dataArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark tableView dataSource And delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            NameIconViewController *nameIconVC = [[NameIconViewController alloc] init];
            [self.navigationController pushViewController:nameIconVC animated:YES];
        }
            break;
        case 1:
        {
            AlertViewController *alertVC = [[AlertViewController alloc] init];
            [self.navigationController pushViewController:alertVC animated:YES];
        }
            break;
        case 2:
        {
            MoveViewController *alertVC = [[MoveViewController alloc] init];
            [self.navigationController pushViewController:alertVC animated:YES];
        }
            break;
        case 3:
        {
            CycleViewController *cycleVC = [[CycleViewController alloc] init];
            [self.navigationController pushViewController:cycleVC animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
