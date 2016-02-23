//
//  ALLViewController.m
//  UseJson
//
//  Created by kaiser on 16/2/16.
//  Copyright © 2016年 kaiser. All rights reserved.
//

#import "ALLViewController.h"
#import "ALLCell.h"
#import "DetailsViewController.h"

@interface ALLViewController ()

@end

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
#define KLatestKivaLoansURL [NSURL URLWithString:@"https://www.v2ex.com/api/topics/latest.json"]


@implementation ALLViewController
{
    NSArray *alljsons;
}
@synthesize newtableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupRefresh];
    
    dispatch_async
    (kBgQueue, ^
      {
        NSData *data = [NSData dataWithContentsOfURL:KLatestKivaLoansURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
      }
     );

   self.automaticallyAdjustsScrollViewInsets = false;   //..........去掉TableView上方留白
}

-(void)setupRefresh
{
    //1.添加刷新控件
    UIRefreshControl *control=[[UIRefreshControl alloc]init];
    [control addTarget:self action:@selector(refreshStateChange:) forControlEvents:UIControlEventValueChanged];
    [self.newtableView addSubview:control];
    
    //2.马上进入刷新状态，并不会触发UIControlEventValueChanged事件
    [control beginRefreshing];
    
    // 3.加载数据
    [self refreshStateChange:control];
}



    // UIRefreshControl进入刷新状态：加载最新的数据

-(void)refreshStateChange:(UIRefreshControl *)control
{
    // 3.发送请求
    dispatch_async(kBgQueue, ^{
        NSData *data = [NSData dataWithContentsOfURL:KLatestKivaLoansURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
    
    {
        //1.获取数据，处理数据，传递数据给tableView
        
        //2.刷新表格
        [self.newtableView reloadData];
        
        // 3. 结束刷新
        [control endRefreshing];
    }
    {
        // 结束刷新 ，为了避免网络加载失败，一直显示刷新状态的错误
        [control endRefreshing];
    };
}

-(void)fetchedData:(NSData *)responseData
{
    NSError *error;
    
    alljsons = [NSJSONSerialization
                JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    [self.newtableView reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [alljsons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ALLCell";
    [newtableView deselectRowAtIndexPath:indexPath animated:YES];
     ALLCell *cell = (ALLCell *)[newtableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle]
                        loadNibNamed:@"ALLCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    NSDictionary *catalogue = [alljsons objectAtIndex:indexPath.row];
    NSDictionary *member = [catalogue objectForKey:@"member"];
    
    NSString *headlink = [member objectForKey:@"avatar_normal"];
    NSData *head = [NSData dataWithContentsOfURL:[NSURL URLWithString:
                                                  [@"https:" stringByAppendingString: headlink]]
                    ];
    
    cell.newavatarImage.image = [UIImage imageWithData:head];
    
    cell.newidLabel.text = [member objectForKey:@"username"];
    
    cell.newtitleLabel.text = [catalogue objectForKey:@"title"];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    NSIndexPath *indexPath = [self.newtableView indexPathForSelectedRow];
    
    NSDictionary *acatalogue = [alljsons objectAtIndex:indexPath.row];
    
    DetailsViewController *destViewController = segue.destinationViewController;
    destViewController.content = acatalogue;
    destViewController.member = [acatalogue objectForKey:@"member"];
    destViewController.node = [acatalogue objectForKey:@"node"];
    destViewController.hidesBottomBarWhenPushed = YES;
}


@end
