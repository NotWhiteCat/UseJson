//
//  ALLViewController.h
//  UseJson
//
//  Created by kaiser on 16/2/16.
//  Copyright © 2016年 kaiser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALLViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *newtableView;
@end
