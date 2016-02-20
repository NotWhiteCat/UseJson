//
//  ViewController.m
//  UseJson
//
//  Created by kaiser on 15/12/14.
//  Copyright © 2015年 kaiser. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "MemberViewController.h"
@interface ViewController ()

@end
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
#define KLatestKivaLoansURL [NSURL URLWithString:@"https://www.v2ex.com/api/topics/hot.json"]




@implementation ViewController
{
    NSArray *wzhangs;
    int i;
}
@synthesize tableView2;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    dispatch_async(kBgQueue, ^{
        NSData *data = [NSData dataWithContentsOfURL:KLatestKivaLoansURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
    
    //NSDictionary * wenzhang = [wzhangs objectAtIndex:i];

    
    //user = [catalogue objectForKey:@"member"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)fetchedData:(NSData *)responseData
{
    NSError *error;
    
    wzhangs = [NSJSONSerialization
               JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    [self.tableView2 reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [wzhangs count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    Cell *cell = (Cell *)[tableView2 dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle]
                        loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
   // NSDictionary * catalogue = [wzhangs objectAtIndex:i];
    //    NSString *idd = [NSString stringWithFormat:@"%@", [wenzhang objectForKey:@"id"]];
    NSDictionary *catalogue = [wzhangs objectAtIndex:indexPath.row];
    
    
    cell.urlLabel.text = [catalogue objectForKey:@"url"];
    
    cell.idLabel.text = [[catalogue objectForKey:@"id"] stringValue];
    
    cell.titleLabel.text = [catalogue objectForKey:@"title"];
    
        
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showmember"])
    {
        NSIndexPath *indexPath = [self.tableView2 indexPathForSelectedRow];
       
        NSDictionary *acatalogue = [wzhangs objectAtIndex:indexPath.row];
        
        MemberViewController *destViewController = segue.destinationViewController;
        destViewController.aacatalogue = acatalogue;
        destViewController.member = [acatalogue objectForKey:@"member"];
        destViewController.node = [acatalogue objectForKey:@"node"];
    }
}

@end
