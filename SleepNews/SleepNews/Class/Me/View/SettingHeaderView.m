//
//  SettingHeaderView.m
//  SleepNews
//
//  Created by Kavee DJ on 2016/12/4.
//  Copyright © 2016年 Kavee DJ. All rights reserved.
//

#import "SettingHeaderView.h"

@implementation SettingHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        // 设置HeadView尺寸
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0.6 * SCREEN_WIDTH);
        self.backgroundColor = [UIColor colorWithRed:186/255.0f green:71/255.0f blue:58/255.0f alpha:1];
        
        // 设置注销按钮
        UIButton *logoutBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 30, 50, 20)];
        [logoutBtn addTarget:self action:@selector(logoutBtnClick) forControlEvents:UIControlEventTouchUpInside];
        logoutBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [logoutBtn setTitle:@"注销" forState:UIControlStateNormal];
        [self addSubview:logoutBtn];
        
        
        
    }
    return self;
}

@end
