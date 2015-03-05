//
//  AppDelegate.m
//  LogTest
//
//  Created by zhangjunbo on 15/3/5.
//  Copyright (c) 2015年 ZhangJunbo. All rights reserved.
//

#import "AppDelegate.h"

#import <CocoaLumberjack/CocoaLumberjack.h>
#import "LogFormatter.h"

@interface AppDelegate () {
    DDFileLogger *fileLogger;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    LogFormatter *formatter = [[LogFormatter alloc] init];
    
    [[DDASLLogger sharedInstance] setLogFormatter:formatter];
    [[DDTTYLogger sharedInstance] setLogFormatter:formatter];
    
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *docDir = [paths objectAtIndex:0];
    DDLogFileManagerDefault *logFileManager = [[DDLogFileManagerDefault alloc] initWithLogsDirectory:[docDir stringByAppendingPathComponent:@"Logs"]];
    fileLogger = [[DDFileLogger alloc] initWithLogFileManager:logFileManager];
    fileLogger.maximumFileSize  = 1024 * 1;  // 1 KB
    fileLogger.rollingFrequency =   60 * 1;  // 1 Minute
    fileLogger.logFileManager.maximumNumberOfLogFiles = 4;
    [fileLogger setLogFormatter:formatter];
    
    [DDLog addLogger:fileLogger];
    
    
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
