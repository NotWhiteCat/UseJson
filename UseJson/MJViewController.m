//
//  MJViewController.m
//  UseJson
//
//  Created by kaiser on 15/12/14.
//  Copyright © 2015年 kaiser. All rights reserved.
//

#import "MJViewController.h"
#import "WebViewController.h"

@interface MJViewController ()
{
     UIScrollView *_scrollView;
}

@end

@implementation MJViewController

@synthesize aacatalogue;
@synthesize member;
@synthesize node;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 1.创建UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height); // frame中的size指UIScrollView的可视范围   （自适应屏幕）
    scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:scrollView];
    
    
    UIView *userView = [[UIView alloc] init];
    userView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
    userView.backgroundColor = [UIColor blackColor];
    [scrollView addSubview:userView];
    
    // 2.创建UIImageView（图片）
    
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = [UIImage imageNamed:@"big.jpg"];
//    CGFloat imgW = imageView.image.size.width; // 图片的宽度
//    CGFloat imgH = imageView.image.size.height; // 图片的高度
//    imageView.frame = CGRectMake(0, 0, imgW, imgH);
//    [scrollView addSubview:imageView];
    
    //头像
    UIImageView *memberavatar = [[UIImageView alloc] init];
    NSString *picture1 = [member objectForKey:@"avatar_normal"];
    NSData *data1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:
                                                  [@"https:" stringByAppendingString: picture1]]];
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
    atitle.text = [aacatalogue objectForKey:@"title"];
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
    
//    UILabel *nodeurlLabel = [[UILabel alloc] init];
//    nodeurlLabel.text = [node objectForKey:@"url"];
//    nodeurlLabel.frame = CGRectMake(70, 245, 400, 20);
//    nodeurlLabel.textColor = [UIColor redColor];
//    nodeurlLabel.font = [UIFont fontWithName:@"Heiti SC" size:13];  //iOS7默认字体Heiti SC
//    [scrollView addSubview:nodeurlLabel];
    
//  content内容
    UILabel *contentLabel=[[UILabel alloc] init];
    contentLabel.text = [aacatalogue objectForKey:@"content"];
    
    NSStringDrawingOptions options =NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin ;
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
    CGSize size = [[aacatalogue objectForKey:@"content"]
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
    
//    UIFont *font = [UIFont fontWithName:@"Arial" size:12];
//    CGSize size = CGSizeMake(300, MAXFLOAT);
//    CGSize labelsize = [[aacatalogue objectForKey:@"content"]
//                        sizeWithFont:font
//                        constrainedToSize:size
//                        lineBreakMode:NSLineBreakByCharWrapping];


    
    // 3.设置scrollView的属性
    
    // 设置UIScrollView的滚动范围（内容大小）
    //scrollView.contentSize = imageView.image.size;

    CGFloat h = 110;   //....................................显示用户信息的视图高度
    CGFloat H = size.height+h;
    
    scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,H);
    
    // 隐藏滚动条
    scrollView.showsHorizontalScrollIndicator = NO;   //...............水平滚动条
    scrollView.showsVerticalScrollIndicator = YES;    //...............竖直滚动条
    
    // 用来记录scrollview滚动的位置
    //    scrollView.contentOffset = ;
    
    // 去掉弹簧效果
    //scrollView.bounces = NO;
    
    // 增加额外的滚动区域（逆时针，上、左、下、右）
    // top  left  bottom  right
    
    scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _scrollView = scrollView;

}



- (IBAction)down:(UIButton *)sender
{
    [UIView animateWithDuration:1.0 animations:^
    {
        //三个步骤
        CGPoint offset = _scrollView.contentOffset;
        offset.y += 150;
        _scrollView.contentOffset = offset;
        
        //_scrollView.contentOffset = CGPointMake(0, 0);
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)lookmeAction:(id)sender
{
    [self performSegueWithIdentifier:@"showweb" sender:sender];
    
}

-(void)lookallAction:(id)sender
{

    [self performSegueWithIdentifier:@"showweb2" sender:sender];
}


-(void) prepareForSegue: (UIStoryboardSegue *)segue sender: (id) sender{
     if ([segue.identifier isEqualToString:@"showweb"])
    {
        WebViewController *page2 = segue.destinationViewController;
         //[page2 setValue: @"https://baidu.com" forKey:@"website"];
        page2.website = [aacatalogue objectForKey:@"url"];
    }
    else if ([segue.identifier isEqualToString:@"showweb2"])
    {
        id page = segue.destinationViewController;
        [page setValue: [node objectForKey:@"url"] forKey:@"website2"];
    }
}




@end
