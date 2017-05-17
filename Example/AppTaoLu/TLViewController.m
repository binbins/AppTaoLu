//
//  TLViewController.m
//  AppTaoLu
//
//  Created by binbins on 03/19/2017.
//  Copyright (c) 2017 binbins. All rights reserved.
//

#import "TLViewController.h"
@import SDWebImage;
@import AppTaoLu;

@interface TLViewController ()

@end

@implementation TLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)viewWillAppear:(BOOL)animated {
    NSURL *coverurl = [SafeObject safeUrl:[TLRemoteConfig localConfig] objectForKey:@"ad_cover_url"];
    if (coverurl) {
        [[SDWebImagePrefetcher sharedImagePrefetcher]prefetchURLs:@[coverurl]]; //预加载
    }
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
    [TaoLu resetTaoLu];
}











@end
