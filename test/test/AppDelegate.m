//
//  AppDelegate.m
//  test
//
//  Created by MengWang on 15-5-11.
//  Copyright (c) 2015年 YukiWang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *str = @"😋";
    NSString *dataUTF8 = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@", dataUTF8);
    
    // 过滤emoji表情
    // 字符串转换成utf-8的 然后，遍历字符串
    const char *oldString = [dataUTF8 UTF8String];
    char *newString = malloc(strlen(oldString) * sizeof(char));
    NSInteger oldIndex = 0;
    NSInteger newIndex = 0;
    while (oldString[oldIndex]) {
        // 与运算（当前oldString[oldIndex]是0xF0开头的才相等）
        if ((oldString[oldIndex] & 0xF0) == 0xF0) {
            // 直接跳过
            oldIndex += 4;
            continue;
        }
        newString[newIndex] = oldString[oldIndex];
        // 结束符
        if (oldString[oldIndex] == '\0') {
            break;
        }
        oldIndex++;
        newIndex++;
    }
    NSString *result = [NSString stringWithUTF8String:newString];
    free(newString);
    NSLog(@"%@", result);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
