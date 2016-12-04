//
//  BaseViewController.m
//  SleepNews
//
//  Created by Kavee DJ on 2016/12/4.
//  Copyright © 2016年 Kavee DJ. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)canSwipBack {
    return YES;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    KLog(@"Controller dealloc = %@",NSStringFromClass([self class]));
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
