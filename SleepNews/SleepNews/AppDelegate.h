//
//  AppDelegate.h
//  SleepNews
//
//  Created by Kavee DJ on 2016/12/4.
//  Copyright © 2016年 Kavee DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 *  选择进入哪一个tabbar控制器
 *
 *  @param index index从0开始
 */
- (void)selectTabbarIndex:(int)index;


@end

