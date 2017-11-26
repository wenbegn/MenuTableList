//
//  maskingView.h
//  MenuTableList
//
//  Created by wenbegn on 2017/11/26.
//  Copyright © 2017年 wenbegn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectRowBlock)(NSInteger row, NSString *rowTitle);
@interface maskingView : UIView

-(void)getDataSource:(NSArray *)arr menuIndex:(NSInteger)menuIndex;
-(void)reloadData;
-(void)dismiss;
-(void)show:(UIView *)superView;

@property (nonatomic, copy) SelectRowBlock selectRowBlock;
@end
