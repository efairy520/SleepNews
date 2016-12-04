//
//  MeViewController.m
//  SleepNews
//
//  Created by Kavee DJ on 2016/12/4.
//  Copyright © 2016年 Kavee DJ. All rights reserved.
//

#import "MeViewController.h"
#import <SDWebImage/SDImageCache.h>
#import "SettingHeaderView.h"
#import "SettingItem.h"
#import "SettingArrowItem.h"
#import "CollectViewController.h"
#import "SettingSwitchItem.h"
#import "SettingGroup.h"

@interface MeViewController ()

/** 头部视图 */
@property (nonatomic, weak) UIView *headerView;
/** 表格视图 */
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic , copy) NSString * chatCount;     //未读消息数目
@property (nonatomic , strong) NSMutableArray *arrays;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SettingHeaderView *headerView = [[SettingHeaderView alloc] init];
    headerView.loginBlock = ^{
        
    };
    self.headerView = headerView;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableHeaderView = headerView;
    self.tableView = tableView;
    
    self.tableView.backgroundColor = [[ThemeManager sharedInstance] themeColor];
    
    [self setupGroup0];
    [self setupGroup2];
}

- (void)setupGroup0 {
    SettingItem *shouCang = [SettingArrowItem itemWithItem:@"MorePush" title:@"收藏" VcClass:[CollectViewController class]];
    SettingItem *handShake = [SettingSwitchItem itemWithItem:@"handShake" title:@"夜间模式"];
    
    SettingGroup *group0 = [[SettingGroup alloc] init];
    
    group0.items = @[shouCang, handShake];
     [self.arrays addObject:group0];

}

- (void)setupGroup2 {
}

#pragma mark - tableview代理数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrays.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SettingGroup *group = self.arrays[section];
    return group.items.count;
}


@end
