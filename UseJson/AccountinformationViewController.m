//
//  Account informationViewController.m
//  UseJson
//
//  Created by kaiser on 15/12/18.
//  Copyright © 2015年 kaiser. All rights reserved.
//

#import "AccountinformationViewController.h"

@interface AccountinformationViewController ()

@end

@implementation AccountinformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self retrieveValuesFromAppSettings];
    self.hidesBottomBarWhenPushed = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)retrieveValuesFromAppSettings
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *initialDefaults = [[NSDictionary alloc] initWithObjectsAndKeys:
                                     @"big",kPicture,
                                     @"登录名",kUserName,
                                     @"密码",kPassword,
                                     @"Email",kEmail,
                                     @"0000-0000000",kPhone, nil];
    [userDefaults registerDefaults:initialDefaults];
    
    NSString *picturePreference = [[NSString alloc] initWithFormat:@"%@.jpg",
                                   [userDefaults stringForKey:kPicture]];
    self.picture.image = [UIImage imageNamed:picturePreference];
    self.username.text=[userDefaults stringForKey:kUserName];
    self.password.text=[userDefaults stringForKey:kPassword];
    self.email.text=[userDefaults stringForKey:kEmail];
    self.phone.text=[userDefaults stringForKey:kPhone];
    
    
}

@end
