//
//  FlagView.h
//  MenuTableList
//
//  Created by wenbegn on 2017/11/26.
//  Copyright © 2017年 wenbegn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectBlock)(NSInteger index, NSString *content);
@interface FlagView : UIScrollView

@property (nonatomic, copy) selectBlock selectBlock;
-(void)setUpSubviewsWithTitles:(NSArray *)titles;

@end
