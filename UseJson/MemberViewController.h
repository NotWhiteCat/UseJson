//
//  MemberViewController.h
//  UseJson
//
//  Created by kaiser on 15/12/14.
//  Copyright © 2015年 kaiser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

@property (strong, nonatomic) IBOutlet UILabel *memberusernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *memberidLabel;

@property (strong, nonatomic) IBOutlet UILabel *nodenameLabel;
@property (strong, nonatomic) IBOutlet UILabel *nodeidLabel;
@property (strong, nonatomic) IBOutlet UILabel *title_alternativeLabel;
@property (strong, nonatomic) IBOutlet UILabel *nodeurlLabel;
@property (strong, nonatomic) IBOutlet UILabel *nodetitleLabel;


//@property (strong, nonatomic) NSString *memberusername;
//@property (strong, nonatomic) NSString *memberid;
//
//@property (strong, nonatomic) NSString *nodename;
//@property (strong, nonatomic) NSString *nodeid;
//@property (strong, nonatomic) NSString *title_alternative;
//@property (strong, nonatomic) NSString *nodeurl;
//@property (strong, nonatomic) NSString *nodetitle;
//
//@property (strong, nonatomic) NSString *content;


@property (strong, nonatomic) NSDictionary *aacatalogue;
@property (strong, nonatomic) NSDictionary *member;
@property (strong, nonatomic) NSDictionary *node;

@end
