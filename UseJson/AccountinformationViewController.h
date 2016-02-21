//
//  Account informationViewController.h
//  UseJson
//
//  Created by kaiser on 15/12/18.
//  Copyright © 2015年 kaiser. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kUserName @"UserName"
#define kPassword @"Password"
#define kEmail  @"Email"
#define kPhone  @"Phone"
#define kPicture    @"Picture"

@interface AccountinformationViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *username;
@property (strong, nonatomic) IBOutlet UILabel *password;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UIImageView *picture;
-(void)retrieveValuesFromAppSettings;


@end
