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

#import "SettingGroup.h"
#import "SettingLabelItem.h"
#import "SettingCell.h"
#import "SettingArrowItem.h"
#import "SettingSwitchItem.h"


#import "ShareManager.h"

@interface MeViewController ()<UITableViewDataSource,UITableViewDelegate>

/** 头部视图 */
@property (nonatomic, weak) UIView *headerView;
/** 表格视图 */
@property (nonatomic, weak) UITableView *tableView;
/** 存放数据的数组 */
@property (nonatomic , strong) NSMutableArray *arrays;
/** 当前缓存 */
@property (nonatomic , strong) NSString *clearCacheName;

@end

@implementation MeViewController

- (NSMutableArray *)arrays
{
    if (!_arrays) {
        _arrays = [NSMutableArray array];
    }
    return _arrays;
}

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
    [self setupGroup1];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
    [self.navigationController setNavigationBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    float tmpSize = [[SDImageCache sharedImageCache] getSize];
    NSString *clearCacheName = tmpSize >= 1 ? [NSString stringWithFormat:@"%.1fMB", tmpSize/(1024*1024)] : [NSString stringWithFormat:@"%.1fKB",tmpSize * 1024];
    self.clearCacheName = clearCacheName;
    
    self.arrays = nil;
    [self setupGroup0];
    [self setupGroup1];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self.navigationController setNavigationBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)setupGroup0 {
    SettingItem *shouCang = [SettingLabelItem itemWithItem:@"MorePush" title:@"收藏"];
    SettingItem *handShake = [SettingLabelItem itemWithItem:@"handShake" title:@"夜间模式"];
    
    SettingGroup *group0 = [[SettingGroup alloc] init];
    
    group0.items = @[shouCang, handShake];
    [self.arrays addObject:group0];
}

- (void)setupGroup1 {
    
    IMP_BLOCK_SELF(MeViewController);
    
    SettingItem *moreHelp = [SettingLabelItem itemWithItem:@"MoreHelp" title:@"帮助与反馈"];
    
    SettingItem *moreShare = [SettingArrowItem itemWithItem:@"MoreShare" title:@"分享给好友" VcClass:nil];
    moreShare.optionHandler = ^{
        [[ShareManager sharedInstance] shareWeiboWithTitle:nil images:nil dismissBlock:^{
            [block_self.navigationController popViewControllerAnimated:YES];
        }];
    };
    
    
    SettingItem *handShake = [SettingArrowItem itemWithItem:@"handShake" title:@"清除缓存" subtitle:self.clearCacheName];
    handShake.optionHandler = ^{
        [block_self click];
    };
    
    SettingItem *MoreAbout = [SettingArrowItem itemWithItem:@"MoreAbout" title:@"关于" VcClass:nil];
    MoreAbout.optionHandler = ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"关于我们" message:@"此项目只供技术交流，不能作为商业用途。\n邮箱:efairy520@gmail.com" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    };
    
    SettingGroup *group1 = [[SettingGroup alloc] init];
    group1.items = @[moreHelp,moreShare,handShake,MoreAbout];
    [self.arrays addObject:group1];
}

#pragma mark - 清除缓存
- (void)click
{
    IMP_BLOCK_SELF(MeViewController);
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    [[[UIApplication sharedApplication].windows firstObject] addSubview:hud];
    //加载条上显示文本
    hud.labelText = @"急速清理中";
    //置当前的view为灰度
    hud.dimBackground = YES;
    //设置对话框样式
    hud.mode = MBProgressHUDModeDeterminate;
    [hud showAnimated:YES whileExecutingBlock:^{
        while (hud.progress < 1.0) {
            hud.progress += 0.01;
            [NSThread sleepForTimeInterval:0.02];
        }
        hud.labelText = @"清理完成";
    } completionBlock:^{
        [[SDImageCache sharedImageCache] clearDisk];
        [[SDImageCache sharedImageCache] clearMemory];
        block_self.clearCacheName = @"0.0KB";
        block_self.arrays = nil;
        [block_self setupGroup0];
        [block_self setupGroup1];
        [block_self.tableView reloadData];
        [hud removeFromSuperview];
    }];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingCell *cell = [SettingCell cellWithTableView:tableView];
    if ([[[ThemeManager sharedInstance] themeName] isEqualToString:@"系统默认"]) {
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor blackColor];
    } else {
        cell.backgroundColor = [[ThemeManager sharedInstance] themeColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    SettingGroup *group = self.arrays[indexPath.section];
    cell.item = group.items[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SettingGroup *group = self.arrays[indexPath.section];
    SettingItem *item = group.items[indexPath.row];
    
    if (item.optionHandler) {
        item.optionHandler();
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}


@end
