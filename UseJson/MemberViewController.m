//
//  MemberViewController.m
//  UseJson
//
//  Created by kaiser on 15/12/14.
//  Copyright © 2015年 kaiser. All rights reserved.
//

#import "MemberViewController.h"

@interface MemberViewController ()

@end

@implementation MemberViewController

@synthesize contentLabel = _contentLabel;

@synthesize memberusernameLabel = _memberusernameLabel;
@synthesize memberidLabel = _memberidLabel;

@synthesize nodenameLabel = _nodenameLabel;
@synthesize nodeidLabel = _nodeidLabel;
@synthesize title_alternativeLabel = _title_alternativeLabel;
@synthesize nodeurlLabel = _nodeurlLabel;
@synthesize nodetitleLabel = _nodetitleLabel;


//@synthesize memberusername;
//@synthesize memberid;
//
//@synthesize nodename;
//@synthesize nodeid;
//@synthesize nodeurl;
//@synthesize nodetitle;
//@synthesize title_alternative;
//
//@synthesize content;

@synthesize aacatalogue;
@synthesize member;
@synthesize node;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.memberusernameLabel.text = [member objectForKey:@"username"];
    self.memberidLabel.text = [[member objectForKey:@"id"] stringValue];
    
    self.nodenameLabel.text = [node objectForKey:@"name"];
    self.nodeidLabel.text = [[node objectForKey:@"id"] stringValue];
    self.nodetitleLabel.text = [node objectForKey:@"title"];
    self.nodeurlLabel.text = [node objectForKey:@"url"];
    self.title_alternativeLabel.text = [node objectForKey:@"title_alternative"];
    self.contentLabel.text = [aacatalogue objectForKey:@"content"];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
