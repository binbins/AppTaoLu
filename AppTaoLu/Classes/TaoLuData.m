//
//  TaoLuData.m
//  Pods
//
//  Created by yuebin on 17/3/20.
//
//

#import "TaoLuData.h"
#import "ModalAD.h"
#import "ModalUP.h"
#import "ModalRate.h"
#import "UIViewController+Utils.h"

@import TLRemoteConfig;
@import StoreKit;

@implementation TaoLuData

static dispatch_once_t onceToken;
static TaoLuData *taoLuManager;

+ (instancetype)shareInstance {
    dispatch_once(&onceToken, ^{
        taoLuManager = [[TaoLuData alloc]init];
    });
    return taoLuManager;
}

@end



@implementation TaoLu

+ (void)checkResultIfOnwaiting {

    if (![TLUSERDEFAULTS boolForKey:KEY_ONWAINTING]) {
        return;
    }
    [TLUSERDEFAULTS setBool:NO forKey:KEY_ONWAINTING];
    
    TaoLuData *taoluData = [TaoLuData shareInstance];
    if ([[NSDate date] laterDate:taoluData.supposedTime] == taoluData.supposedTime) {
        NSLog(@"提前回来，没有完成好评");
    }else {
        
        [TLUSERDEFAULTS setBool:YES forKey:[TaoLu rateFlag]];
        NSLog(@"完成好评任务");
    }
}

+ (void)resetTaoLu {

    [TLUSERDEFAULTS setObject:@(NO) forKey:[self adFlag]];
    [TLUSERDEFAULTS setObject:@(NO) forKey:[self rateFlag]];
    [TaoLuData shareInstance].haveShowRateTimes = [TaoLuData shareInstance].rateCallTimes = 0;
}

+ (BOOL)showModalAd {   //与广告相关
    
    if (![self taoIsEnable]) {
        NSLog(@"[TaoLu showModalAd] 套路关闭");
        return NO;
    }
    if (![self adEnable]) {
        NSLog(@"[TaoLu showModalAd] 广告关闭");
        return NO;
    }
    if ([TLUSERDEFAULTS boolForKey:[self adFlag]]) {
        NSLog(@"[TaoLu showModalAd] 此广告已经弹出过");
        return NO;
    }
    
    [TLUSERDEFAULTS setObject:@(YES) forKey:[self adFlag]];
    
    ModalAD *ctrl = [ModalAD defaultModal];
    [[UIViewController currentViewController] presentViewController:ctrl animated:NO completion:nil];
    return YES;
}

+ (BOOL)showModalUp {   //与版本
    
    if (![self taoIsEnable]) {
        NSLog(@"[TaoLu showModalUp]套路关闭");
        return NO;
    }
    if (![self upEnable]) {
        NSLog(@"[TaoLu showModalUp] 升级关闭");
        return NO;
    }
    
    if (![self shouldPushUpModal]) {
        NSLog(@"[TaoLu showModalUp] 已经是最新版本了，不用弹出");
        return NO;
    }
    ModalUP *ctrl = [ModalUP defaultModal];
    [[UIViewController currentViewController] presentViewController:ctrl animated:NO completion:nil];
    return YES;
}

+ (BOOL)showModalRateBaseTimes { //与版本相关
    NSInteger interval = [TLRemoteConfig intForKey:@"rate_interval"];
    NSInteger maxTimes = [TLRemoteConfig intForKey:@"rate_max_shows_per_life"];
    
    if (![self taoIsEnable]) {
        NSLog(@"[TaoLu showModalRate] 套路关闭");
        return NO;
    }
    if (![self rateEnable]) {
        NSLog(@"[TaoLu showModalRate] 好评关闭");
        return NO;
    }
    
    if ([TLUSERDEFAULTS boolForKey:[self rateFlag]]) {
        NSLog(@"[TaoLu showModalRate] 已经好评过，不再弹出");
        return NO;
    }
    
    NSInteger haveShowTime = [TaoLuData shareInstance].haveShowRateTimes;
    if (haveShowTime >= maxTimes) {
        NSLog(@"[TaoLu showModalRate] 本局已显示好评次数：%ld 超过单局最大次数：%ld", (long)haveShowTime, (long)maxTimes);
        return NO;
    }
    
    NSInteger callTimes = [TaoLuData shareInstance].rateCallTimes;
    [TaoLuData shareInstance].rateCallTimes ++; //首次弹
    if (callTimes % interval != 0) {
        NSLog(@"[TaoLu showModalRate] 不满足好评间隔约束 当前：%ld 间隔：%ld", (long)callTimes, (long)interval);
        return NO;
    }
    
    BOOL isCustom = [TLRemoteConfig boolForKey:@"rate_style_custom"];
    [TaoLuData shareInstance].haveShowRateTimes ++;
    if (isCustom) {
        ModalRate *ctrl = [ModalRate defaultModal];
        [[UIViewController currentViewController] presentViewController:ctrl animated:NO completion:nil];
    }else {
        [SKStoreReviewController requestReview];
        return NO;
    }
    return YES;
}

+ (BOOL)showModalRate {

    if (![self taoIsEnable]) {
        NSLog(@"[TaoLu showModalRate] 套路关闭");
        return NO;
    }
    if (![self rateEnable]) {
        NSLog(@"[TaoLu showModalRate] 好评关闭");
        return NO;
    }
    
    if ([TLUSERDEFAULTS boolForKey:[self rateFlag]]) {
        NSLog(@"[TaoLu showModalRate] 已经好评过，不再弹出");
        return NO;
    }
    
    ModalRate *ctrl = [ModalRate defaultModal];
    [[UIViewController currentViewController] presentViewController:ctrl animated:NO completion:nil];
    return YES;
}

#pragma mark - 返回开关

+ (BOOL)taoIsEnable {
    return [TLRemoteConfig boolForKey:@"a_taolu_enable"];
}

+ (BOOL)rateEnable {
    return [TLRemoteConfig boolForKey:@"enable_rate"];
}

+ (BOOL)adEnable {
    return [TLRemoteConfig boolForKey:@"enable_ad"];
}

+ (BOOL)upEnable {
    return [TLRemoteConfig boolForKey:@"enable_up"];
}

#pragma mark - flag

+ (NSString *)rateFlag {
    
    NSString *flag = [@"rate" stringByAppendingString:TLAppVerName];
    return flag;
}

+ (NSString *)adFlag {
    NSString *adid = [TLRemoteConfig stringForKey:@"ad_id"];
    NSString *flag = [@"ourad" stringByAppendingString:adid];
    return flag;
}

+ (BOOL)shouldPushUpModal {
    NSString *newVersion = [TLRemoteConfig stringForKey:@"up_new_version"];
    if ([newVersion isEqualToString:TLAppVerName]) {
        return NO;
    }
    return YES;
}

@end













