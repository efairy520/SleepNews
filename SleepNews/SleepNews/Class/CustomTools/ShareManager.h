//
//  ShareManager.h
//  SleepNews
//
//  Created by Kavee DJ on 2016/12/5.
//  Copyright © 2016年 Kavee DJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareManager : NSObject

+ (instancetype)sharedInstance;

- (void)shareWeiboWithTitle:(NSString *)title images:(UIImage *)image dismissBlock:(void(^)())dismissBlock;

@end
