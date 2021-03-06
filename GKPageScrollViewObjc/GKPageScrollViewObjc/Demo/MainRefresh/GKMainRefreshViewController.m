//
//  GKMainRefreshViewController.m
//  GKPageScrollViewDemo
//
//  Created by gaokun on 2018/12/11.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import "GKMainRefreshViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface GKMainRefreshViewController ()

@end

@implementation GKMainRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"MainRefresh";
    
    self.pageScrollView.mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kRefreshDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.pageScrollView.mainTableView.mj_header endRefreshing];
            
            [self.pageScrollView reloadData];
            
            // 取出当前显示的listView
            GKBaseListViewController *currentListVC = self.childVCs[self.segmentView.selectedIndex];
            
            // 模拟下拉刷新
            currentListVC.count = 30;
            [currentListVC.tableView reloadData];
        });
    }];
    
    [self.pageScrollView.mainTableView.mj_header beginRefreshing];
}

@end
