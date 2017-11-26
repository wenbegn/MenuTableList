//
//  listLabel.m
//  MenuTableList
//
//  Created by wenbegn on 2017/11/26.
//  Copyright © 2017年 wenbegn. All rights reserved.
//

#import "listLabel.h"

@implementation listLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(void)settingUpWithName:(NSString *)name {
    self.text = name;
    self.font = [UIFont systemFontOfSize:13];
    UIFont *font = self.font;
    CGSize size = [name sizeWithAttributes:@{NSFontAttributeName : font}];
    CGRect frame = self.frame;
    frame.size = CGSizeMake(size.width + 20, size.height + 10);
    self.frame = frame;
    
    self.layer.cornerRadius = 12;
    self.layer.borderColor = self.textColor.CGColor;
    self.layer.borderWidth = 1.0;
}

@end
