//
//  ViewController.m
//  MasonryDemo
//
//  Created by mengxiangjian on 2020/1/9.
//  Copyright © 2020 mengxiangjian. All rights reserved.
//

#import "ViewController.h"
#import "MMCollectionViewCell.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collectionView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 0.f;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                             collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[MMCollectionViewCell class]
            forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}

#pragma mark -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                                                           forIndexPath:indexPath];
    NSString *shortTitle = @"短标题";
    NSString *longTitle = @"很长很长很长很长很长很长";
    NSString *shortNumber = @"100";
    NSString *longNumber = @"10000000";
    [cell showWithTitle:(indexPath.item % 2 == 0) ? shortTitle : longTitle
                 number:(indexPath.item % 3 == 0) ? shortNumber : longNumber];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (self.view.bounds.size.width - 24.f) / 2.f;
    CGFloat height = width;
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10.f, 0, 10.f);
}

@end
