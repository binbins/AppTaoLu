//
//  TLViewController.m
//  AppTaoLu
//
//  Created by binbins on 03/19/2017.
//  Copyright (c) 2017 binbins. All rights reserved.
//

#import "TLViewController.h"
@import AppTaoLu;

@interface TLViewController ()

@end

@implementation TLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - outlet

- (IBAction)pushRate:(id)sender {
    
    [TaoLu showModalRate];
}

- (IBAction)pushAD:(id)sender {
    
    [TaoLu showModalAd];
}

- (IBAction)pushUP:(id)sender {
    
    [TaoLu showModalUp];
}

- (IBAction)pushTip:(id)sender {
    [TaoLu showModalTip];
}











@end
