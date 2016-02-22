//
//  ViewController.m
//  UseJson
//
//  Created by kaiser on 15/12/14.
//  Copyright © 2015年 kaiser. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "MJViewController.h"
#import "WebViewController.h"
#import "Web.h"

@interface ViewController ()

@end
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
#define KLatestKivaLoansURL [NSURL URLWithString:@"https://www.v2ex.com/api/topics/hot.json"]




@implementation ViewController
{
    NSArray *webjsons;
}
@synthesize tableView2;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(kBgQueue, ^{
        NSData *data = [NSData dataWithContentsOfURL:KLatestKivaLoansURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
    
     [self setupRefresh];
    
    int i;
    for (i=1; i<[webjsons count]; i++)
    {
        NSDictionary * a= [webjsons objectAtIndex:i];
        Web *webjson = [Web new];
        webjson.ID =[a objectForKey:@"id"];
        webjson.title = [a objectForKey:@"title"];
        webjson.url = [a objectForKey:@"url"];
        webjson.content = [a objectForKey:@"content"];
        webjson.content_rendered = [a objectForKey:@"content_rendered"];
        webjson.memberID = [[a objectForKey:@"member"] objectForKey:@"id"];
        webjson.username = [[a objectForKey:@"member"] objectForKey:@"username"];
        webjson.avatar_mini = [[a objectForKey:@"member"] objectForKey:@"avatar_mini"];
        webjson.avatar_normal = [[a objectForKey:@"member"] objectForKey:@"avatar_normal"];
        webjson.avatar_large = [[a objectForKey:@"member"] objectForKey:@"avatar_large"];
        webjson.nodeID = [[a objectForKey:@"node"] objectForKey:@"id"];
        webjson.nodename = [[a objectForKey:@"node"] objectForKey:@"name"];
        webjson.nodetitle = [[a objectForKey:@"node"] objectForKey:@"title"];
        webjson.nodeT_A = [[a objectForKey:@"node"] objectForKey:@"title_alternative"];
        webjson.nodeavatar_mini = [[a objectForKey:@"node"] objectForKey:@"nodeavatar_mini"];
        webjson.nodeavatar_normal = [[a objectForKey:@"node"] objectForKey:@"nodeavatar_normal"];
        webjson.nodeavatar_large = [[a objectForKey:@"node"] objectForKey:@"nodeavatar_large"];
    }

   
}

-(void)setupRefresh
{
    //1.添加刷新控件
    UIRefreshControl *control=[[UIRefreshControl alloc]init];
    [control addTarget:self action:@selector(refreshStateChange:) forControlEvents:UIControlEventValueChanged];
    [self.tableView2 addSubview:control];
    
    //2.马上进入刷新状态，并不会触发UIControlEventValueChanged事件
    [control beginRefreshing];
    
    // 3.加载数据
    [self refreshStateChange:control];
}


/**
 *  UIRefreshControl进入刷新状态：加载最新的数据
 */
-(void)refreshStateChange:(UIRefreshControl *)control
{
    // 3.发送请求
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    [mgr GET:@"https://api.weibo.com/2/statuses/public_timeline.json" parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject)
    

    dispatch_async(kBgQueue, ^{
        NSData *data = [NSData dataWithContentsOfURL:KLatestKivaLoansURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });

    
    {
        
        //1.获取数据，处理数据，传递数据给tableView,如：
        
        // 将最新的微博数据，添加到总数组的最前面
//        NSRange range = NSMakeRange(0, newStatuses.count);
//        NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
//        [self.statuses insertObjects:newStatuses atIndexes:set];
//        
        //2.刷新表格
        [self.tableView2 reloadData];
        
        // 3. 结束刷新
        [control endRefreshing];
        
    }
    
    {
        
        // 结束刷新刷新 ，为了避免网络加载失败，一直显示刷新状态的错误
        [control endRefreshing];
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)fetchedData:(NSData *)responseData
{
    NSError *error;
    
    webjsons = [NSJSONSerialization
               JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    [self.tableView2 reloadData];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [webjsons count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"Cell";
    
    Cell *cell = (Cell *)[tableView2 dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle]
                        loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    

    NSDictionary *catalogue = [webjsons objectAtIndex:indexPath.row];
    NSDictionary *amember = [catalogue objectForKey:@"member"];
    
    
    
    NSString *picture1 = [amember objectForKey:@"avatar_normal"];
    NSData *data1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:
                                                   [@"https:" stringByAppendingString: picture1]]];
    cell.avatarImage.image = [UIImage imageWithData:data1];
    
    cell.idLabel.text = [amember objectForKey:@"username"];
    
    cell.titleLabel.text = [catalogue objectForKey:@"title"];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showmember"])
    {
        NSIndexPath *indexPath = [self.tableView2 indexPathForSelectedRow];
       
        NSDictionary *acatalogue = [webjsons objectAtIndex:indexPath.row];
        
        MJViewController *destViewController = segue.destinationViewController;
        destViewController.aacatalogue = acatalogue;
        destViewController.member = [acatalogue objectForKey:@"member"];
        destViewController.node = [acatalogue objectForKey:@"node"];
        destViewController.hidesBottomBarWhenPushed = YES;
    }
//    else if ([segue.identifier isEqualToString:@"showweb"])
//    {
//        NSIndexPath *indexPath = [self.tableView2 indexPathForSelectedRow];
//        
//        NSDictionary *acatalogue = [wzhangs objectAtIndex:indexPath.row];
//        
//        WebViewController *destViewController = segue.destinationViewController;
//        
//        destViewController.website = [acatalogue objectForKey:@"url"];
//    
//    }
    
}


@end
