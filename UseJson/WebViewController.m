//
//  WebViewController.m
//  UseJson
//
//  Created by kaiser on 15/12/16.
//  Copyright © 2015年 kaiser. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
{
    UIWebView *_webView;
}

@end

@implementation WebViewController

@synthesize loading;
@synthesize website;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0, 0, 375, 667); // frame中的size指UIScrollView的可视范围
    webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:webView];
//    self.loading = [[UIActivityIndicatorView  alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
//    self.loading.activityIndicatorViewStyle=UIActivityIndicatorViewStyleGray;
//    self.loading.color=[UIColor redColor];
//    self.loading.hidesWhenStopped=YES;
//    [self.loading startAnimating];
    
    
    NSURL *url = [[NSURL alloc]initWithString:website];
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
//    [self.loading stopAnimating];
//    [webView addSubview:self.loading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}



@end
