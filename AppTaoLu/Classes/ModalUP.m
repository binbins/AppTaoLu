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
    NSLog(@"转换成字典%@",[TaoLuData dataUp]);
    
    NSString *mainTitel = [self stringInUpDict:@"title"];
    NSString *content = [self stringInUpDict:@"content"];
    NSString *cancelText = [self stringInUpDict:@"cancel_text"];
    NSString *confirmText = [self stringInUpDict:@"confirm_text"];
    self.mainTitle.text = mainTitel;
    self.updateText.text = content;
    [self.cancelBtn setTitle:cancelText forState:UIControlStateNormal];
    [self.confirmBtn setTitle:confirmText forState:UIControlStateNormal];
}

- (NSString *)stringInUpDict:(NSString *)key {
    return [SafeObject safeString:[TaoLuData dataUp] objectForKey:key];
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
    
    NSURL *targetUrl = [SafeObject safeUrl:[TaoLuData dataUp] objectForKey:@"target_url"];
    [[UIApplication sharedApplication]openURL:targetUrl];
}



@end
