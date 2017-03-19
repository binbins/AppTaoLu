//
//  TLAppDelegate.m
//  AppTaoLu
//
//  Created by binbins on 03/19/2017.
//  Copyright (c) 2017 binbins. All rights reserved.
//

#define TESTUTL @"http://service.kv.dandanjiang.tv/online/params"
#define LOCALURL @"http://192.168.0.217:9100/"
#import "TLAppDelegate.h"
@import OnlineConfig;

@implementation TLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [ConfigRequest updateConfig:LOCALURL];
    return YES;
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [ConfigRequest updateConfig:LOCALURL];
}

#pragma mark -
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
