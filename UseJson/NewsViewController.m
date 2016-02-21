//
//  NewsViewController.m
//  UseJson
//
//  Created by kaiser on 16/1/26.
//  Copyright © 2016年 kaiser. All rights reserved.
//

#import "NewsViewController.h"
#import "SecondViewController.h"
@interface NewsViewController ()

@end

@implementation NewsViewController
{
    UIView *backView;
    NSArray *hotspot;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 637);
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    

    
    hotspot = [NSArray arrayWithObjects:@"111", @"222", @"333",
               @"444", @"555", @"666", @"777", nil];
    
    UITableView *oneView = [[UITableView alloc] initWithFrame:self.view.frame];
    oneView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 565);
    [backView addSubview:oneView];
    oneView.delegate = self;
    oneView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)button1:(id)sender
{
    for(int i = 0;i<=[backView.subviews count];i++)
    {
        [ [ backView.subviews objectAtIndex:i] removeFromSuperview];
    }
    
    hotspot = [NSArray arrayWithObjects:@"111", @"222", @"333",
               @"444", @"555", @"666", @"777", nil];

    UITableView *oneView = [[UITableView alloc] initWithFrame:self.view.frame];
    oneView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 565);
    [backView addSubview:oneView];
    oneView.delegate = self;
    oneView.dataSource = self;

    
}
- (IBAction)button2:(id)sender
{
    
}
- (IBAction)button3:(id)sender
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [hotspot  count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [hotspot objectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78; }



@end
