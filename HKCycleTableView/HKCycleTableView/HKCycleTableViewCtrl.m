//
//  HKCycleTableViewCtrl.m
//  HKCycleTableView
//
//  Created by ghk on 2017/11/20.
//  Copyright © 2017年 geng hongkai. All rights reserved.
//

#import "HKCycleTableViewCtrl.h"

#define FHRandomColor [UIColor colorWithRed:(arc4random_uniform(256))/255.0 green:(arc4random_uniform(256))/255.0 blue:(arc4random_uniform(256))/255.0 alpha:1.0]

@interface HKCycleTableViewCtrl ()
<UITableViewDelegate,
UITableViewDataSource>

/** <##>*/
@property (nonatomic, strong) UITableView *tableView;

/** <##>*/
@property (nonatomic, strong) NSArray *dataArray;
/** <##>*/
@property (nonatomic, strong) NSTimer *timer;
/** <##> */
@property (nonatomic, assign) NSInteger count;

@end

@implementation HKCycleTableViewCtrl

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [self.view addSubview:self.tableView];

    [self performSelector:@selector(openCycle) withObject:nil afterDelay:0.5];
}

- (void)openCycle
{
    [self.timer fire];
    _count = 0;
}

#pragma mark - timer target
- (void)autoScroll
{   CGFloat scrollGap = 3 * _count++;
    [self.tableView setContentOffset:CGPointMake(0, scrollGap) animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count*1000;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = self.dataArray[indexPath.row % _dataArray.count];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.backgroundColor = FHRandomColor;
    return cell;

}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 150;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{

}

#pragma mark - getter 方法
- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"进度1",@"进度2",@"进度3",@"进度4"];
    }
    return _dataArray;
}

- (UITableView *)tableView
{
    if (!_tableView) {

        //创建表格视图
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSTimer *)timer {

    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

- (void)dealloc
{
    NSLog(@"%s",__func__);

}


@end
