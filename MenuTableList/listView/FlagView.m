//
//  FlagView.m
//  MenuTableList
//
//  Created by wenbegn on 2017/11/26.
//  Copyright © 2017年 wenbegn. All rights reserved.
//

#import "FlagView.h"
#import "listLabel.h"

@interface FlagView ()

@property (nonatomic, strong) NSMutableArray *tags;

@end
@implementation FlagView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bounces = NO;
        self.pagingEnabled = YES;
    }
    return self;
}

-(NSMutableArray *)tags
{
    if (!_tags) {
        _tags = [NSMutableArray array];
    }
    return _tags;
}

-(void)setUpSubviewsWithTitles:(NSArray *)titles
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.tags removeAllObjects];
    
    for (int i = 0; i < titles.count; i++) {
        listLabel *label = [[listLabel alloc]initWithFrame:CGRectZero];
        [label settingUpWithName:titles[i]];
        [self addSubview:label];
        [self.tags addObject:label];
        label.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectlabelClick:)];
        [label addGestureRecognizer:tap];
        label.userInteractionEnabled = YES;
        
    }
    
    [self setupAllSubviews];
}

-(void)selectlabelClick:(UITapGestureRecognizer *)tap {
    listLabel *label = (listLabel *)tap.view;
    if (self.selectBlock) {
        self.selectBlock(label.tag, label.text);
    }
}

-(void)setupAllSubviews {
    CGFloat marginX = 20;
    CGFloat marginY = 20;
    
    __block CGFloat x = 0;
    __block CGFloat y = 10;
    
    [self.tags enumerateObjectsUsingBlock:^(listLabel  *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat height = CGRectGetHeight(obj.frame);
        if (idx == 0) {
            x = marginX;
        }else{
            x = CGRectGetMaxX([self.tags[idx - 1] frame]) + marginX;
            if (x + CGRectGetWidth(obj.frame) + marginX > CGRectGetWidth(self.frame)) {
                x = marginX;
                y += height;
                y += marginY;
            }
        }
        CGRect frame = obj.frame;
        frame.origin = CGPointMake(x, y);
        obj.frame = frame;
    }];
    
    
    if (y == 10) {
        [self.tags enumerateObjectsUsingBlock:^(listLabel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGFloat height = CGRectGetHeight(obj.frame);
            y = CGRectGetHeight(self.frame)/2 - height/2.0;
            
            if (idx == 0) {
                x = marginX;
            }else{
                x = CGRectGetMaxX([self.tags[idx - 1] frame]) + marginX;
            }
            CGRect frame = obj.frame;
            frame.origin = CGPointMake(x, y);
            obj.frame = frame;
        }];
    }
    
    CGFloat contentHeight = CGRectGetMaxY([self.tags.lastObject frame]) + 10;
    if (contentHeight < CGRectGetHeight(self.frame)) {
        contentHeight = 0;
    }
    self.contentSize = CGSizeMake(0, contentHeight);
    
}


@end
