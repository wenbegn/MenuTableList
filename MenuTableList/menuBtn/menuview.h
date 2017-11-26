//
//  menuview.h
//  MenuTableList
//
//  Created by wenbegn on 2017/11/26.
//  Copyright © 2017年 wenbegn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class menuview;
typedef void(^clickMenuBtn)(menuview *menue, NSInteger index, NSString *selectTitle, NSInteger row, NSString *rowTitle);
@interface menuview : UIView

@property (nonatomic, strong) NSArray <NSArray *> *listTitles;
@property (nonatomic, copy) clickMenuBtn clickBlock;
-(instancetype)initWithFrame:(CGRect)frame menuTitles:(NSArray *)menuTitles;

@end
