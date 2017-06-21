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

#pragma mark -

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self addNotification];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self removeNotification];
}

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismiss) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)removeNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
