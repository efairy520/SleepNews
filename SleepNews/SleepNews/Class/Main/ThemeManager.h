//
//  ThemeManager.h
//  SleepNews
//
//  Created by Kavee DJ on 2016/12/4.
//  Copyright © 2016年 Kavee DJ. All rights reserved.
//

#define Bundle_Of_ThemeResource @"ThemeResource"
#define Bundle_Path_Of_ThemeResource [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:Bundle_Of_ThemeResource]

#define Notice_Theme_Changed @"Notice_Theme_Changed"

#import <Foundation/Foundation.h>

@interface ThemeManager : NSObject

@property(nonatomic,copy)NSString *themeName;
@property(nonatomic,copy)NSString *themePath;
@property(nonatomic,strong)UIColor *themeColor;
@property (nonatomic , strong) UIColor *oldColor;

+ (ThemeManager*)sharedInstance;

-(void)changeThemeWithName:(NSString*)themeName;

- (UIImage*)themedImageWithName:(NSString*)imgName;

-(NSArray *)listOfAllTheme;

@end
