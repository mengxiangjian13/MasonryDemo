//
//  MMCollectionViewCell.h
//  MasonryDemo
//
//  Created by mengxiangjian on 2020/1/9.
//  Copyright © 2020 mengxiangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MMCollectionViewCell : UICollectionViewCell

- (void)showWithTitle:(NSString *)title
               number:(NSString *)number;

@end

NS_ASSUME_NONNULL_END
