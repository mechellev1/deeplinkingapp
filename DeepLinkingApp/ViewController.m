//
//  ViewController.m
//  DeepLinkingApp
//
//  Created by Mechelle Sieglitz on 2/28/19.
//  Copyright © 2019 Mechelle Sieglitz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)openOtherAppTapped:(id)sender {
    NSString *customURL = @"urlschemeapp://test_page/one?token=12345&domain=foo.com";
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:customURL]])
    {
        
        //if you want to send parameters, you have to send them through the URL
        //NSString *customURL = @"iOSDevTips://?token=123abct&registered=1";
        //scheme://host/path?query
        
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL] options:@{} completionHandler:nil];
       
        
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"URL error" message:[NSString stringWithFormat:@"No custom URL defined for %@", customURL] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
