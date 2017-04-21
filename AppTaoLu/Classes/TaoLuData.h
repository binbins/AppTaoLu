//
//  TaoLuData.h
//  Pods
//
//  Created by yuebin on 17/3/20.
//
//
#define KEY_ONWAINTING @"onwaiting"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TaoLuData : NSObject
@property (nonatomic, assign) NSInteger rateCallTimes, haveShowRateTimes;
@property (nonatomic, strong)NSDate *supposedTime;

+ (TaoLuData *)shareInstance;


@end


@interface TaoLu : NSObject

+ (void)checkResultIfOnwaiting;

+ (BOOL)taoIsEnable;//开关

+ (void)resetTaoLu;

//打开对应的模态视图
+ (BOOL)showModalAd;

+ (BOOL)showModalUp;

+ (BOOL)showModalRate;

+ (BOOL)showModalRateBaseTimes;

+ (BOOL)showModalTip;

#pragma mark - 标记key

+ (NSString *)rateFlag;

+ (NSString *)adFlag;

+ (NSString *)tipFlag;





@end
