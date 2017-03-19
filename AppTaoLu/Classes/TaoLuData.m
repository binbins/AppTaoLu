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

+ (void)showModalAd {   //与广告相关
    
    if (![self taoIsEnable]) {
        NSLog(@"套路关闭");
        return;
    }
    if (![self adEnable]) {
        NSLog(@"广告关闭");
        return;
    }
    if ([USERDEFAULTS boolForKey:[self adFlag]]) {
        NSLog(@"此广告已经弹出过");
        return;
    }
    
    [USERDEFAULTS setObject:@(YES) forKey:[self adFlag]];
    
    ModalAD *ctrl = [ModalAD defaultModal];
    [[UIViewController currentViewController] presentViewController:ctrl animated:NO completion:nil];
}

+ (void)showModalUp {   //与版本
    
    if (![self taoIsEnable]) {
        NSLog(@"套路关闭");
        return;
    }
    if (![self upEnable]) {
        NSLog(@"升级关闭");
        return;
    }
    
    if (![self shouldPushUpModal]) {
        NSLog(@"已经是最新版本了，不用弹出");
        return;
    }
    ModalUP *ctrl = [ModalUP defaultModal];
    [[UIViewController currentViewController] presentViewController:ctrl animated:NO completion:nil];
}

+ (void)showModalRate { //与版本相关
    
    if (![self taoIsEnable]) {
        NSLog(@"套路关闭");
        return;
    }
    if (![self rateEnable]) {
        NSLog(@"好评关闭");
        return;
    }
    
    if ([USERDEFAULTS boolForKey:[self rateFlag]]) {
        NSLog(@"已经好评过，不再弹出");
        return;
    }
    ModalRate *ctrl = [ModalRate defaultModal];
    [[UIViewController currentViewController] presentViewController:ctrl animated:NO completion:nil];
}

+ (void)showModalTip {
    
    if (![self taoIsEnable]) {
        NSLog(@"套路关闭");
        return;
    }
    if (![self tipEnable]) {
        NSLog(@"强提示关闭");
        return;
    }
    NSLog(@"这个要做吗，有用吗");
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













