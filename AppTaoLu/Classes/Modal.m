//
//  Modal.m
//  Pods
//
//  Created by yuebin on 17/3/19.
//
//

#import "Modal.h"

@interface Modal ()

@end

@implementation Modal

+ (instancetype)defaultModal {
    
    NSString *xibName = NSStringFromClass([self class]);
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UIViewController *modal = [[self alloc] initWithNibName:xibName bundle:bundle];
    [modal setDefinesPresentationContext:YES];
    modal.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    modal.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    return (id)modal;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
