//
//  ALLViewController.m
//  UseJson
//
//  Created by kaiser on 16/2/16.
//  Copyright © 2016年 kaiser. All rights reserved.
//

#import "ALLViewController.h"
#import "ALLCell.h"

@interface ALLViewController ()

@end

//#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
//#define KLatestKivaLoansURL [NSURL URLWithString:@"https://www.v2ex.com/api/topics/hot.json"]

@implementation ALLViewController
{
    NSArray *alljsons;
}
@synthesize newtableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    alljsons = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast",
               @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
   self.automaticallyAdjustsScrollViewInsets = false;   //..........去掉TableView上方留白
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [alljsons count];
}

- (NSInteger)newtableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [alljsons count]; }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:simpleTableIdentifier]; }
    cell.textLabel.text = [alljsons objectAtIndex:indexPath.row];


    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
