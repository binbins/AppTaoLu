//
//  ModalRate.m
//  Pods
//
//  Created by yuebin on 17/3/19.
//
//
#define SYSTEM_RATE_TIMES @"system_rate_times"


#import "ModalRate.h"
@import StoreKit;

@interface ModalRate ()

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *mainTitle;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *subTitle;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *cancelBtn;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *confirBtn;


@end

@implementation ModalRate

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    
    NSString *mainTitle = [TLRemoteConfig stringForKey:@"rate_main_title"];
    NSString *subTitle = [TLRemoteConfig stringForKey:@"rate_sub_title"];
    NSString *cancelText = [TLRemoteConfig stringForKey:@"rate_cancel_text"];
    NSString *confirmText = [TLRemoteConfig stringForKey:@"rate_confirm_text"];
    
    self.mainTitle.text = mainTitle;
    self.subTitle.text = subTitle;
    [self.cancelBtn setTitle:cancelText forState:UIControlStateNormal];
    [self.confirBtn setTitle:confirmText forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - outlet

- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)confirmAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
    
    NSURL *targetUrl = [SafeObject safeUrl:[TLRemoteConfig localConfig] objectForKey:@"rate_targeturl"];
    [[UIApplication sharedApplication]openURL:targetUrl];
    [self enableRateDelay];
}

- (void)enableRateDelay {
    NSInteger delay = [TLRemoteConfig intForKey:@"rate_limit_time"];
    NSLog(@"好评有效时间 %ld", delay);
    [TaoLuData shareInstance].supposedTime = [NSDate dateWithTimeIntervalSinceNow:delay];
    [USERDEFAULTS setBool:YES forKey:KEY_ONWAINTING];
}
@end
