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
    NSLog(@"转换成字典%@",[TaoLuData dataAd]);
}

- (void)initView {
    
    NSURL *coverurl = [SafeObject safeUrl:[TaoLuData dataAd] objectForKey:@"cover_url"];
    [self.adCover sd_setImageWithURL:coverurl];
    
    BOOL *hideForce = (BOOL)[SafeObject safeBool:[TaoLuData dataAd] objectForKey:@"strategy_force"];
    self.closeBtn.hidden = hideForce;
    
    NSString *confirmTitle = [SafeObject safeString:[TaoLuData dataAd] objectForKey:@"btn_text"];
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
    
    NSURL *targetUrl = [SafeObject safeUrl:[TaoLuData dataAd] objectForKey:@"target_url"];
    [[UIApplication sharedApplication]openURL:targetUrl];
}

- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end
