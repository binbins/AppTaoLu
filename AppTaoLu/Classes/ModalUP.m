//
//  ModalUP.m
//  Pods
//
//  Created by yuebin on 17/3/19.
//
//

#import "ModalUP.h"

@interface ModalUP ()

@property (weak, nonatomic) IBOutlet UILabel *mainTitle;
@property (weak, nonatomic) IBOutlet UITextView *updateText;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@end

@implementation ModalUP

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    NSString *mainTitel = [TLRemoteConfig stringForKey:@"up_title"];
    NSString *content = [TLRemoteConfig stringForKey:@"up_content"];
    NSString *confirmText = [TLRemoteConfig stringForKey:@"up_confirm_text"];
    
    self.mainTitle.text = mainTitel;
    
    self.updateText.text = [content stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    
    [self.confirmBtn setTitle:confirmText forState:UIControlStateNormal];
    BOOL hideForce = [TLRemoteConfig boolForKey:@"up_strategy_force"];
    self.cancelBtn.hidden = hideForce;
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
    
    NSURL *targetUrl = [SafeObject safeUrl:[TLRemoteConfig localConfig] objectForKey:@"up_targeturl"];
    [[UIApplication sharedApplication]openURL:targetUrl];
}



@end
