//
//  ModalAD.m
//  Pods
//
//  Created by yuebin on 17/3/19.
//
//

#import "ModalAD.h"

@interface ModalAD ()

@property (weak, nonatomic) IBOutlet UIImageView *adCover;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;



@end

@implementation ModalAD

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initView];
}

- (void)initView {
    
    NSURL *coverurl = [SafeObject safeUrl:[TLRemoteConfig localConfig] objectForKey:@"ad_cover_url"];
    [self.adCover sd_setImageWithURL:coverurl];
    [self.adCover setContentMode:UIViewContentModeScaleAspectFill];
    
    BOOL hideForce = [TLRemoteConfig boolForKey:@"ad_strategy_force"];
    self.closeBtn.hidden = hideForce;
    
    NSString *confirmTitle = [TLRemoteConfig stringForKey:@"ad_btn_text"];
    [self.confirmBtn setTitle:confirmTitle forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - outlet

- (IBAction)touchCover:(id)sender {
    [self confirmAction:sender];
}

- (IBAction)confirmAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
    
    NSURL *targetUrl = [SafeObject safeUrl:[TLRemoteConfig localConfig] objectForKey:@"ad_target_url"];
    [[UIApplication sharedApplication]openURL:targetUrl];
}

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end
