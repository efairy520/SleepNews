//
//  AppDelegate.m
//  SleepNews
//
//  Created by Kavee DJ on 2016/12/4.
//  Copyright © 2016年 Kavee DJ. All rights reserved.
//

#import "AppDelegate.h"
#import "TabbarViewController.h"

@interface AppDelegate ()


@property (nonatomic, strong) TabbarViewController *tabbarMain;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.tabbarMain = [[TabbarViewController alloc] init];
    self.window.rootViewController = self.tabbarMain;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)selectTabbarIndex:(int)index {
    [self.tabbarMain selectIndex:index];
}

@end
