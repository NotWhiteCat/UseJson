//
//  HomePageViewController.m
//  UseJson
//
//  Created by kaiser on 16/2/23.
//  Copyright © 2016年 kaiser. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

@synthesize homepage;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0, 0, 375, 667);
    webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:webView];
    
    
    
    NSURL *url = [[NSURL alloc]initWithString:homepage];
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
