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

+ (BOOL)taoIsEnable;//开关

+ (void)showModalAd;

+ (void)showModalUp;

+ (void)showModalRate;

+ (void)showModalTip;

#pragma mark - 标记key

+ (NSString *)rateFlag;

+ (NSString *)adFlag;

+ (NSString *)tipFlag;





@end
