//
//  TLAppDelegate.m
//  AppTaoLu
//
//  Created by binbins on 03/19/2017.
//  Copyright (c) 2017 binbins. All rights reserved.
//


#import "TLAppDelegate.h"
@import TLRemoteConfig;
@import AppTaoLu;

@implementation TLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [TLRemoteConfig updateRemoteConfig];
    return YES;
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [TaoLu checkResultIfOnwaiting];
}


@end
