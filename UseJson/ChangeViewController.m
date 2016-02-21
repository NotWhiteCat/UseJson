//
//  ChangeViewController.m
//  UseJson
//
//  Created by kaiser on 16/1/3.
//  Copyright © 2016年 kaiser. All rights reserved.
//

#import "ChangeViewController.h"
#import "OtherCell.h"
#import "Others.h"
@interface ChangeViewController ()
{
    UIView *downView;
    NSArray *others;
}

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    downView = [[UIView alloc] init];
    downView.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 637);
    downView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:downView];
    
    UILabel *v2ex = [[UILabel alloc] init];
    v2ex.text = @"Welcome";
    v2ex.frame = CGRectMake(100, 200, 100, 20);
    v2ex.textColor = [UIColor brownColor];
    v2ex.font = [UIFont fontWithName:@"Marker Felt" size:14];
    [downView addSubview:v2ex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)chenge1:(id)sender
{
    
    for(int i = 0;i<=[downView.subviews count];i++)
    {
        [ [ downView.subviews objectAtIndex:i] removeFromSuperview];
    }
//        money = [NSArray arrayWithObjects:@"20",@"23", @"27", @"21",
//                 @"28", @"25", @"23", @"26", @"15", @"17", @"12",nil];
//    
//        otherpicture = [NSArray arrayWithObjects:@"Jay1.jpg", @"Jay2.jpg", @"Jay3.jpg",
//                        @"Jay4.jpg", @"Jay5.jpg", @"Jay6.jpg", @"Jay7.jpg", @"Jay8.jpg",
//                        @"Jay9.jpg", @"Jay10.jpg", @"Jay11.jpg", nil];
    Others *other1 = [Others new];
    other1.money = @"20";
    other1.otherpicture = @"Jay1.jpg";
    other1.albumname = @"范特西";
    
    Others *other2 = [Others new];
    other2.money = @"23";
    other2.otherpicture = @"Jay2.jpg";
    other2.albumname = @"牛仔很忙";
    
    Others *other3 = [Others new];
    other3.money = @"27";
    other3.otherpicture = @"Jay3.jpg";
    other3.albumname = @"七里香";
    
    Others *other4 = [Others new];
    other4.money = @"21";
    other4.otherpicture = @"Jay4.jpg";
    other4.albumname = @"哎哟,不错哦";
    
    Others *other5 = [Others new];
    other5.money = @"28";
    other5.otherpicture = @"Jay5.jpg";
    other5.albumname = @"叶惠美";
    
    Others *other6 = [Others new];
    other6.money = @"25";
    other6.otherpicture = @"Jay6.jpg";
    other6.albumname = @"依然范特西";
    
    Others *other7 = [Others new];
    other7.money = @"23";
    other7.otherpicture = @"Jay7.jpg";
    other7.albumname = @"跨时代";
    
    Others *other8 = [Others new];
    other8.money = @"26";
    other8.otherpicture = @"Jay8.jpg";
    other8.albumname = @"八度空间";
    
    Others *other9 = [Others new];
    other9.money = @"15";
    other9.otherpicture = @"Jay9.jpg";
    other9.albumname = @"惊叹号!";
    
    Others *other10 = [Others new];
    other10.money = @"17";
    other10.otherpicture = @"Jay10.jpg";
    other10.albumname = @"摩羯座";
    
    Others *other11 = [Others new];
    other11.money = @"12";
    other11.otherpicture = @"Jay11.jpg";
    other11.albumname = @"十二新作";
    
    others = [NSArray arrayWithObjects:other1, other2, other3, other4, other5,
              other6, other7, other8, other9, other10, other11, nil];
    
    UITableView *redView = [[UITableView alloc] initWithFrame:self.view.frame];
    redView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 565);
    [downView addSubview:redView];
    redView.delegate = self;
    redView.dataSource = self;
    
}
- (IBAction)change2:(id)sender
{
    for(int i = 0;i<=[downView.subviews count];i++)
    {
        [ [ downView.subviews objectAtIndex:i] removeFromSuperview];
    }
    UIView *cyanView = [[UIView alloc] init];
    cyanView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 637);
    cyanView.backgroundColor = [UIColor cyanColor];
    [downView addSubview:cyanView];
    
    UILabel *v2ex = [[UILabel alloc] init];
    v2ex.text = @"You press change2";
    v2ex.frame = CGRectMake(100, 200, 200, 20);
    v2ex.textColor = [UIColor brownColor];
    v2ex.font = [UIFont fontWithName:@"Marker Felt" size:14];
    [cyanView addSubview:v2ex];
    
}
- (IBAction)change3:(id)sender
{
    
    for(int i = 0;i<=[downView.subviews count];i++)
    {
        [ [ downView.subviews objectAtIndex:i] removeFromSuperview];
    }
    UIView *blackView = [[UIView alloc] init];
    blackView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 637);
    blackView.backgroundColor = [UIColor blackColor];
    [downView addSubview:blackView];
    
    UILabel *v2ex = [[UILabel alloc] init];
    v2ex.text = @"You press change3";
    v2ex.frame = CGRectMake(100, 200, 200, 20);
    v2ex.textColor = [UIColor brownColor];
    v2ex.font = [UIFont fontWithName:@"Marker Felt" size:14];
    [blackView addSubview:v2ex];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [others  count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"OtherCell";
    
    OtherCell *cell = (OtherCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OtherCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
//    cell.otherImageView.image = [UIImage imageNamed:[otherpicture objectAtIndex:indexPath.row]];
//    cell.moneyLabel.text = [money objectAtIndex:indexPath.row];
    
    Others *other = [others objectAtIndex:indexPath.row];
    cell.moneyLabel.text = other.money;
    cell.albumnameLabel.text = other.albumname;
    cell.otherImageView.image = [UIImage imageNamed:other.otherpicture];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78; }

@end
