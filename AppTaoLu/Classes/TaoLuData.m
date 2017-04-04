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
@import OnlineConfig;
#import "UIViewController+Utils.h"

@implementation TaoLuData

static dispatch_once_t onceToken;
static TaoLuData *taoLuManager;

+ (instancetype)shareInstance {
    dispatch_once(&onceToken, ^{
        taoLuManager = [[TaoLuData alloc]init];
    });
    return taoLuManager;
}

+ (NSDictionary *)dataRate {
    return [ConfigRequest dictionaryForKey:@"rate"];
}

+ (NSDictionary *)dataUp {
    return [ConfigRequest dictionaryForKey:@"up"];
}

+ (NSDictionary *)dataAd {
    return [ConfigRequest dictionaryForKey:@"ad"];
}

+ (NSDictionary *)dataTip {
    return [ConfigRequest dictionaryForKey:@"tip"];
}
@end



@implementation TaoLu

static TaoLu *taolu;
static dispatch_once_t oncetoken;

+ (TaoLu *)shareInstance {
    dispatch_once(&onceToken, ^{
        taolu = [[TaoLu alloc]init];
        taolu.onWaiting = NO;
    });
    return taolu;
}

+ (void)checkResultIfOnwaiting {

    if (![TaoLu shareInstance].onWaiting) {
        return;
    }
    TaoLu *taolu = [TaoLu shareInstance];
    taolu.onWaiting = NO;
    
    if ([[NSDate date] laterDate:taolu.supposedTime] == taolu.supposedTime) {
        NSLog(@"提前回来，没有完成好评");
    }else {
        
        [USERDEFAULTS setBool:@(YES) forKey:[TaoLu rateFlag]];
        NSLog(@"完成好评任务");
    }
}

+ (void)resetTaoLu {

    [USERDEFAULTS setObject:@(NO) forKey:[self adFlag]];
    [USERDEFAULTS setObject:@(NO) forKey:[self rateFlag]];
}

+ (BOOL)showModalAd {   //与广告相关
    
    if (![self taoIsEnable]) {
        NSLog(@"套路关闭");
        return NO;
    }
    if (![self adEnable]) {
        NSLog(@"广告关闭");
        return NO;
    }
    if ([USERDEFAULTS boolForKey:[self adFlag]]) {
        NSLog(@"此广告已经弹出过");
        return NO;
    }
    
    [USERDEFAULTS setObject:@(YES) forKey:[self adFlag]];
    
    ModalAD *ctrl = [ModalAD defaultModal];
    [[UIViewController currentViewController] presentViewController:ctrl animated:NO completion:nil];
    return YES;
}

+ (BOOL)showModalUp {   //与版本
    
    if (![self taoIsEnable]) {
        NSLog(@"套路关闭");
        return NO;
    }
    if (![self upEnable]) {
        NSLog(@"升级关闭");
        return NO;
    }
    
    if (![self shouldPushUpModal]) {
        NSLog(@"已经是最新版本了，不用弹出");
        return NO;
    }
    ModalUP *ctrl = [ModalUP defaultModal];
    [[UIViewController currentViewController] presentViewController:ctrl animated:NO completion:nil];
    return YES;
}

+ (BOOL)showModalRate { //与版本相关
    
    if (![self taoIsEnable]) {
        NSLog(@"套路关闭");
        return NO;
    }
    if (![self rateEnable]) {
        NSLog(@"好评关闭");
        return NO;
    }
    
    if ([USERDEFAULTS boolForKey:[self rateFlag]]) {
        NSLog(@"已经好评过，不再弹出");
        return NO;
    }
    ModalRate *ctrl = [ModalRate defaultModal];
    [[UIViewController currentViewController] presentViewController:ctrl animated:NO completion:nil];
    return YES;
}

+ (BOOL)showModalTip {
    
    if (![self taoIsEnable]) {
        NSLog(@"套路关闭");
        return NO;
    }
    if (![self tipEnable]) {
        NSLog(@"强提示关闭");
        return NO;
    }
    NSLog(@"这个要做吗，有用吗");
    return YES;
}

#pragma mark - 返回开关

+ (BOOL)taoIsEnable {
    return [ConfigRequest boolForKey:@"taolu_enable"];
}

+ (BOOL)rateEnable {
    return [ConfigRequest boolForKey:@"enable_rate"];
}

+ (BOOL)adEnable {
    return [ConfigRequest boolForKey:@"enable_ad"];
}

+ (BOOL)upEnable {
    return [ConfigRequest boolForKey:@"enable_up"];
}

+ (BOOL)tipEnable {
    return [ConfigRequest boolForKey:@"enable_tip"];
}

#pragma mark - flag

+ (NSString *)rateFlag {
    
    NSString *flag = [@"rate" stringByAppendingString:AppVerName];
    return flag;
}

+ (NSString *)adFlag {
    NSString *adid = [SafeObject safeString:[TaoLuData dataAd] objectForKey:@"id"];
    NSString *flag = [@"ourad" stringByAppendingString:adid];
    return flag;
}

+ (BOOL)shouldPushUpModal {
    NSString *newVersion = [SafeObject safeString:[TaoLuData dataUp] objectForKey:@"new_version"];
    if ([newVersion isEqualToString:AppVerName]) {
        return NO;
    }
    return YES;
}

+ (NSString *)tipFlag {

}

@end













