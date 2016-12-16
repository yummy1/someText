//
//  CycleView.m
//  自定义封装标准
//
//  Created by 毛毛 on 2016/12/16.
//  Copyright © 2016年 锐拓. All rights reserved.
//

#import "CycleView.h"
#import "CycleCollectionViewCell.h"

#define kScreenWidth   [[UIScreen mainScreen] bounds].size.width
#define kCollectionCellMargin   13
#define MMSection    3

@interface CycleView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *imgArray;
@property (nonatomic, strong)NSTimer *timer;
@end
@implementation CycleView

-(instancetype)initWithFrame:(CGRect)frame
{
    NSLog(@"initWithFrame");
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *coll = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300) collectionViewLayout:flowLayout];
        [coll registerClass:[CycleCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CycleCollectionViewCell class])];
        coll.backgroundColor = [UIColor groupTableViewBackgroundColor];
        coll.delegate = self;
        coll.dataSource = self;
        [coll scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:50 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        _collectionView = coll;
        [self addSubview:coll];
        [self addNSTimer];
    }
    return self;
}
-(NSMutableArray *)imgArray{
    if (!_imgArray) {
        NSArray *array= @[@"cycle1.png", @"cycle2.png", @"cycle1.png", @"cycle2.png"];
        _imgArray=[NSMutableArray array];
        for (int i=0; i<array.count; i++) {
            UIImage *image = [UIImage imageNamed:array[i]];
            [_imgArray addObject:image];
        }
    }
    return _imgArray;
}
- (void)addNSTimer
{
    //    设置1.5秒的定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    //    添加到runloop中
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)removeNSTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
- (void)nextPage
{
    //    获取当前正在展示位置
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    //    下一个需要展示的位置
    NSInteger nextItem = currentIndexPath.item + 1;
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:0];
    //    通过动画滚动到下一个位置
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}
#pragma mark - UICollectionView DataSource delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10000;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CycleCollectionViewCell class]) forIndexPath:indexPath];
    NSInteger index = (int)indexPath.item % self.imgArray.count;
    cell.imageView.image = self.imgArray[index];
    return cell;
}
//当用户开始拖拽的时候就调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeNSTimer];
}
//当用户停止拖拽的时候就调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addNSTimer];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake(kScreenWidth, 150);
    return size;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
