//
//  maskingView.m
//  MenuTableList
//
//  Created by wenbegn on 2017/11/26.
//  Copyright © 2017年 wenbegn. All rights reserved.
//

#import "maskingView.h"

@interface maskingView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) NSInteger menueIndex;
@property (nonatomic, strong) NSMutableDictionary *status;

@end

@implementation maskingView

-(NSMutableDictionary *)status
{
    if (!_status) {
        _status = [NSMutableDictionary new];
    }
    return _status;
}

-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(void)getDataSource:(NSArray *)arr menuIndex:(NSInteger)menuIndex
{
    self.dataSource = [NSMutableArray arrayWithArray:arr];
    _menueIndex = menuIndex;
    [self reloadData];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubviews];
    }
    return self;
}

-(UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.tableFooterView = [UIView new];
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _myTableView;
}


-(void)setUpSubviews {
    [self addSubview:self.myTableView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self reloadData];
    });
}


-(void)reloadData
{
    CGFloat w = self.frame.size.width;
    CGFloat h = self.dataSource.count * 44.0;
    if (h >= self.frame.size.height) {
        h = self.frame.size.height;
    }
    self.myTableView.frame = CGRectMake(0, 0, w, h);
    [self.myTableView reloadData];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = _dataSource[indexPath.row];
    if (self.status[@(_menueIndex)] == indexPath) {
        cell.textLabel.textColor = [UIColor redColor];
    }else{
        cell.textLabel.textColor = [UIColor blackColor];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectRowBlock) {
        self.selectRowBlock(indexPath.row, _dataSource[indexPath.row]);
    }
    self.status[@(_menueIndex)] = indexPath;
    [self.myTableView reloadData];
}

-(void)dismiss
{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect rect = self.myTableView.frame;
        rect.size.height = 0;
        self.myTableView.frame = rect;
    } completion:^(BOOL finished) {
        [self.superview removeFromSuperview];
    }];
}



@end
