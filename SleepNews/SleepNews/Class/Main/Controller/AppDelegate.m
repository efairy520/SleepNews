//
//  AppDelegate.m
//  SleepNews
//
//  Created by Kavee DJ on 2016/12/4.
//  Copyright © 2016年 Kavee DJ. All rights reserved.
//

#import "AppDelegate.h"
#import "TabbarViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"

//新浪微博SDK头文件
#import "WeiboSDK.h"

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
    
    [self setupShareSDK];
    
    return YES;
}

- (void)selectTabbarIndex:(int)index {
    [self.tabbarMain selectIndex:index];
}

#pragma mark - 设置第三方登陆信息
- (void)setupShareSDK
{
    [ShareSDK registerApp:@"19999cbbb2237" activePlatforms:@[@(SSDKPlatformTypeSinaWeibo),@(SSDKPlatformTypeWechat),@(SSDKPlatformTypeQQ)]
                 onImport:^(SSDKPlatformType platformType) {
                     switch (platformType)
                     {
                         case SSDKPlatformTypeWechat:
                             [ShareSDKConnector connectWeChat:[WXApi class]];
                             break;
                         case SSDKPlatformTypeQQ:
                             [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                             break;
                         case SSDKPlatformTypeSinaWeibo:
                             [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                             break;
                         default:
                             break;
                     }
                 } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                     switch (platformType)
                     {
                         case SSDKPlatformTypeSinaWeibo:
                             //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                             [appInfo SSDKSetupSinaWeiboByAppKey:@"139626686"appSecret:@"2f5625d5f72b19126c43a4650796a5a7"redirectUri:@"http://www.baidu.com"
                                                        authType:SSDKAuthTypeBoth];
                             break;
                         case SSDKPlatformTypeWechat:
                             [appInfo SSDKSetupWeChatByAppId:@"wx2aaa2d10871fa3bb4" appSecret:@"1c72adc1f01500c6c5c4d0de4cbb9613e"];
                             break;
                             
                         case SSDKPlatformTypeQQ:
                             //41DD38F3
                             [appInfo SSDKSetupQQByAppId:@"11004984866" appKey:@"HpGu2f0sbpohnbw3F"
                                                authType:SSDKAuthTypeBoth];
                             break;
                         default:
                             break;
                     }
                 }];
    
}


@end
