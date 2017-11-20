//
//  ViewController.m
//  HKCycleTableView
//
//  Created by ghk on 2017/11/20.
//  Copyright © 2017年 geng hongkai. All rights reserved.
//

#import "ViewController.h"
#import "HKCycleTableViewCtrl.h"


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    HKCycleTableViewCtrl *cycleTableViewCtrl = [[HKCycleTableViewCtrl alloc] init];
    [self.navigationController pushViewController:cycleTableViewCtrl animated:YES];
}

@end
