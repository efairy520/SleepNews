//
//  SettingHeaderView.m
//  SleepNews
//
//  Created by Kavee DJ on 2016/12/4.
//  Copyright © 2016年 Kavee DJ. All rights reserved.
//

#import "SettingHeaderView.h"

@interface SettingHeaderView () <UIAlertViewDelegate>

@end

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
        
        // 设置头像
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.frame = CGRectMake(self.frame.size.width/2 - 40, self.frame.size.height/2 - 40, 80, 80);
        imageV.image = [UIImage imageNamed:@"comment_profile_default"];
        [self addSubview:imageV];
        [imageV.layer setCornerRadius:40];
        imageV.clipsToBounds = YES;
        imageV.userInteractionEnabled = YES;
        self.photoImageV = imageV;
        
        // 设置昵称
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageV.frame) + 10, SCREEN_WIDTH, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
        label.text = @"立即登录";
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
        label.userInteractionEnabled = YES;
        self.nameL = label;
        
        // 如果登陆了,就替换成用户的头像和昵称
        NSString *loginImage = [[NSUserDefaults standardUserDefaults] objectForKey:@"LOGINIMAGE"];
        NSString *loginName = [[NSUserDefaults standardUserDefaults]objectForKey:@"LOGINNAME"];
        if (loginImage.length != 0 && loginName.length != 0) {
            [imageV sd_setImageWithURL:[NSURL URLWithString:loginImage]];
            label.text = loginName;
        }
        
        // 添加遮盖
        UIButton *cover = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 40, self.frame.size.height/2 - 40, 80, 110)];
        [cover addTarget:self action:@selector(countLogin) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
    }
    return self;
}

#pragma mark - 登录
- (void)countLogin {
//    if ([self.nameL.text isEqualToString:@"立即登录"]) {
//        if (self.loginBlock) {
//            self.loginBlock;
//        }
//    }else {
//        
//    }
}

#pragma mark - 取消收取 退出
- (void)logoutBtnClick {
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

}

@end
