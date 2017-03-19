//
//  ModalRate.m
//  Pods
//
//  Created by yuebin on 17/3/19.
//
//

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
    NSLog(@"转换成字典%@",[TaoLuData dataRate]);
}

- (void)initView {
    
    NSString *mainTitle = [self stringInRateDict:@"main_title"];
    NSString *subTitle = [self stringInRateDict:@"sub_title"];
    NSString *cancelText = [self stringInRateDict:@"cancel_text"];
    NSString *confirmText = [self stringInRateDict:@"confirm_text"];
    
    self.mainTitle.text = mainTitle;
    self.subTitle.text = subTitle;
    [self.cancelBtn setTitle:cancelText forState:UIControlStateNormal];
    [self.confirBtn setTitle:confirmText forState:UIControlStateNormal];
}

- (NSString *)stringInRateDict:(NSString *)key {
    return [SafeObject safeString:[TaoLuData dataRate] objectForKey:key];
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
    
    [USERDEFAULTS setObject:@(YES) forKey:[TaoLu rateFlag]];
    NSURL *targetUrl = [SafeObject safeUrl:[TaoLuData dataRate] objectForKey:@"target_url"];
    [[UIApplication sharedApplication]openURL:targetUrl];
}


@end
