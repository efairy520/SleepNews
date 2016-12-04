//
//  SettingHeaderView.h
//  SleepNews
//
//  Created by Kavee DJ on 2016/12/4.
//  Copyright © 2016年 Kavee DJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingHeaderView : UIView

/** 头像 */
@property (nonatomic, weak) UIImageView *photoImageV;
/** 昵称 */
@property (nonatomic, weak) UILabel *nameL;

/** 登录Block */
@property (nonatomic, copy) void(^loginBlock)();

@end
