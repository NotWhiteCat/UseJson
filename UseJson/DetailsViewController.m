//
//  DetailsViewController.m
//  UseJson
//
//  Created by kaiser on 16/2/23.
//  Copyright © 2016年 kaiser. All rights reserved.
//

#import "DetailsViewController.h"
#import "UserHPViewController.h"
#import "HomePageViewController.h"

@interface DetailsViewController ()
{
    UIScrollView *_scrollView;
}
@end

@implementation DetailsViewController

@synthesize content;
@synthesize member;
@synthesize node;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height); // frame中的size指UIScrollView的可视范围   （自适应屏幕）
    scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:scrollView];
    
    
    UIView *userView = [[UIView alloc] init];
    userView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
    userView.backgroundColor = [UIColor blackColor];
    [scrollView addSubview:userView];

    //头像
    UIImageView *memberavatar = [[UIImageView alloc] init];
    NSString *head = [member objectForKey:@"avatar_normal"];
    NSData *data1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:
                                               [@"https:" stringByAppendingString: head]]];
    memberavatar.frame = CGRectMake(322, 8, 45, 45);
    memberavatar.image = [UIImage imageWithData:data1];
    [userView addSubview:memberavatar];

    //节点图片
    UIImageView *nodeavatar = [[UIImageView alloc] init];
    NSString *picture2 = [node objectForKey:@"avatar_normal"];
    NSData *data2 = [NSData dataWithContentsOfURL:[NSURL URLWithString:
                                               [@"https:" stringByAppendingString: picture2]]];
    nodeavatar.frame = CGRectMake(10, 11, 15, 15);
    nodeavatar.image = [UIImage imageWithData:data2];
    [userView addSubview:nodeavatar];




    //2.1 创建UILabel (文本)

    //V2EX
    UILabel *v2ex = [[UILabel alloc] init];
    v2ex.text = @"V2EX >";
    v2ex.frame = CGRectMake(30, 9, 45, 20);
    v2ex.textColor = [UIColor brownColor];
    v2ex.font = [UIFont fontWithName:@"Marker Felt" size:14];
    [userView addSubview:v2ex];

    //节点名缩写
    UILabel *nodenameLabel = [[UILabel alloc] init];
    nodenameLabel.text = [node objectForKey:@"name"];
    nodenameLabel.frame = CGRectMake(75, 8.5, 100, 20);
    nodenameLabel.textColor = [UIColor brownColor];
    nodenameLabel.font = [UIFont fontWithName:@"Marker Felt" size:14];
    [userView addSubview:nodenameLabel];

    //用户名称
    UILabel *memberusernameLabel = [[UILabel alloc] init];
    memberusernameLabel.text = [member objectForKey:@"username"];
    memberusernameLabel.frame = CGRectMake(160, 8, 150, 15);
    memberusernameLabel.textColor = [UIColor greenColor];
    memberusernameLabel.font = [UIFont fontWithName:@"Marker Felt" size:15];
    memberusernameLabel.textAlignment = NSTextAlignmentRight;  //....文本居右
    [userView addSubview:memberusernameLabel];

    //内容缩语
    UILabel *atitle = [[UILabel alloc] init];
    atitle.text = [content objectForKey:@"title"];
    atitle.frame = CGRectMake(20, 40, 300, 12);
    atitle.font = [UIFont fontWithName:@"Arial" size:12];
    atitle.textColor = [UIColor brownColor];
    [userView addSubview:atitle];

    //节点主页链接
    UIButton *lookall = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    lookall.frame = CGRectMake(10, 70, 30, 20);
    [lookall setTitle:@"-->" forState:UIControlStateNormal];
    [lookall setTitle:@">>>" forState:UIControlStateHighlighted];
    [lookall addTarget:self action:@selector(lookallAction:) forControlEvents:UIControlEventTouchUpInside];
    [userView addSubview:lookall];

    //节点名称
    UILabel *nodetitleLabel = [[UILabel alloc] init];
    nodetitleLabel.text = [node objectForKey:@"title"];
    nodetitleLabel.frame = CGRectMake(45, 72, 305, 20);
    nodetitleLabel.textColor = [UIColor brownColor];
    nodetitleLabel.font = [UIFont fontWithName:@"GeezaPro" size:12];
    [scrollView addSubview:nodetitleLabel];

    //用户主页链接
    UIButton *lookme = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    lookme.frame = CGRectMake(315, 53, 60, 15);
    [lookme setTitle:@"-->" forState:UIControlStateNormal];
    [lookme setTitle:@">>>" forState:UIControlStateHighlighted];
    [lookme addTarget:self action:@selector(lookmeAction:) forControlEvents:UIControlEventTouchUpInside];
    [userView addSubview:lookme];

    //  content内容
    UILabel *contentLabel=[[UILabel alloc] init];
    contentLabel.text = [content objectForKey:@"content"];

    NSStringDrawingOptions options =NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin ;
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
    CGSize size = [[content objectForKey:@"content"]
               boundingRectWithSize:CGSizeMake(335, CGFLOAT_MAX)
               options:options
               attributes:attribute
               context:nil].size;

    [contentLabel setNumberOfLines:0];  //...............................自动换行
    [contentLabel sizeToFit];
    contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
    contentLabel.font = [UIFont fontWithName:@"Arial" size:12];
    if (size.height<180)
    {
        size.height=240;
    }
    else if (size.height<300)
    {
        size.height=340;
    }
    [contentLabel setFrame:CGRectMake(10, 110, 355, size.height)];
    contentLabel.layer.cornerRadius = 5;     //..........................边框圆角
    contentLabel.layer.borderColor = [UIColor grayColor].CGColor;  //....边框颜色
    contentLabel.layer.borderWidth = 1;      //..........................边框宽度
    contentLabel.textColor = [UIColor brownColor];
    [scrollView addSubview:contentLabel];
    
    // 3.设置scrollView的属性

    CGFloat h = 110;   //....................................显示用户信息的视图高度
    CGFloat H = size.height+h;

    scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,H);

    // 隐藏滚动条
    scrollView.showsHorizontalScrollIndicator = NO;   //...............水平滚动条
    scrollView.showsVerticalScrollIndicator = YES;    //...............竖直滚动条



    scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _scrollView = scrollView;

}

-(void)lookmeAction:(id)sender
{
    [self performSegueWithIdentifier:@"userhp" sender:sender];
    
}

-(void)lookallAction:(id)sender
{
    
    [self performSegueWithIdentifier:@"homepage" sender:sender];
}


-(void) prepareForSegue: (UIStoryboardSegue *)segue sender: (id) sender{
    if ([segue.identifier isEqualToString:@"userhp"])
    {
        UserHPViewController *page2 = segue.destinationViewController;
        page2.userhp = [content objectForKey:@"url"];
    }
    else if ([segue.identifier isEqualToString:@"homepage"])
    {
        id page = segue.destinationViewController;
        [page setValue: [node objectForKey:@"url"] forKey:@"homepage"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
