//
//  Web2ViewController.m
//  UseJson
//
//  Created by kaiser on 15/12/16.
//  Copyright © 2015年 kaiser. All rights reserved.
//

#import "Web2ViewController.h"

@interface Web2ViewController ()

@end

@implementation Web2ViewController

@synthesize website2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0, 0, 375, 667); 
    webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:webView];
    
    
    
    NSURL *url = [[NSURL alloc]initWithString:website2];
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
