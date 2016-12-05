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


@interface MeViewController ()<UITableViewDataSource,UITableViewDelegate>

/** 头部视图 */
@property (nonatomic, weak) UIView *headerView;
/** 表格视图 */
@property (nonatomic, weak) UITableView *tableView;

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
    
//    [self loadConversations];
    
    // 设置第0组
    [self setupGroup0];

}

- (void)setupGroup0 {
    
}


#pragma mark - tableview代理数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.确定重用标示：
    static NSString *ID = @"abs";
    
    // 2.从缓存池中取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.如果空就手动创建
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"OOXX";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
