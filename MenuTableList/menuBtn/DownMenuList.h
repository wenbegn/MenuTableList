//
//  DownMenuList.h
//  MenuTableList
//
//  Created by wenbegn on 2017/11/26.
//  Copyright © 2017年 wenbegn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^dismissBlock)(void);
@interface DownMenuList : UIView

@property (nonatomic, copy) dismissBlock dismissBlock;
@end
