//
//  ALLViewController.m
//  UseJson
//
//  Created by kaiser on 16/2/16.
//  Copyright © 2016年 kaiser. All rights reserved.
//

#import "ALLViewController.h"

@interface ALLViewController ()

@end

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
#define KLatestKivaLoansURL [NSURL URLWithString:@"https://www.v2ex.com/api/topics/hot.json"]

@implementation ALLViewController
{
    NSArray *alljsons;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    dispatch_async(kBgQueue, ^{
        NSData *data = [NSData dataWithContentsOfURL:KLatestKivaLoansURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
}

@end
