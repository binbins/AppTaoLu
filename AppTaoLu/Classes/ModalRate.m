//
//  ModalRate.m
//  Pods
//
//  Created by yuebin on 17/3/19.
//
//
#define RATE_DEFAULT_DELAY 5

#import "ModalRate.h"

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
    
    NSString *mainTitle = [ConfigRequest stringForKey:@"rate_main_title"];
    NSString *subTitle = [ConfigRequest stringForKey:@"rate_sub_title"];
    NSString *cancelText = [ConfigRequest stringForKey:@"rate_cancel_text"];
    NSString *confirmText = [ConfigRequest stringForKey:@"rate_confirm_text"];
    
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
    
    NSURL *targetUrl = [SafeObject safeUrl:[ConfigRequest localConfig] objectForKey:@"rate_targeturl"];
    [[UIApplication sharedApplication]openURL:targetUrl];
    [self enableRateDelay];
}

- (void)enableRateDelay {
    NSInteger delay = [ConfigRequest intForKey:@"rate_limit_time"];
    if(delay<0 || delay>20){
        delay = RATE_DEFAULT_DELAY;
        NSLog(@"启用sdk默认的时间：5");
    }
    [TaoLu shareInstance].supposedTime = [NSDate dateWithTimeIntervalSinceNow:delay];
    [TaoLu shareInstance].onWaiting = YES;
}
@end
