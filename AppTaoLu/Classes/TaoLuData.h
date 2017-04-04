//
//  TaoLuData.h
//  Pods
//
//  Created by yuebin on 17/3/20.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TaoLuData : NSObject

@property (nonatomic, retain) NSDictionary *rateDict, *upDict, *adDict, *tipDict;

+ (NSDictionary *)dataRate;

+ (NSDictionary *)dataUp;

+ (NSDictionary *)dataAd;

+ (NSDictionary *)dataTip;

@end


@interface TaoLu : NSObject

@property (nonatomic, assign)BOOL onWaiting;
@property (nonatomic, strong)NSDate *supposedTime;
+ (TaoLu *)shareInstance;

+ (void)checkResultIfOnwaiting;

+ (BOOL)taoIsEnable;//开关

+ (void)resetTaoLu;

//打开对应的模态视图
+ (BOOL)showModalAd;

+ (BOOL)showModalUp;

+ (BOOL)showModalRate;

+ (BOOL)showModalTip;

#pragma mark - 标记key

+ (NSString *)rateFlag;

+ (NSString *)adFlag;

+ (NSString *)tipFlag;





@end
