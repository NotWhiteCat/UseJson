//
//  Cell.m
//  UseJson
//
//  Created by kaiser on 15/12/14.
//  Copyright © 2015年 kaiser. All rights reserved.
//

#import "Cell.h"



@implementation Cell



@synthesize idLabel = _idLabel;
@synthesize titleLabel = _titleLabel;
@synthesize avatarImage =_avatarImage;


- (void)awakeFromNib
{
    // Initialization code
    
    _idLabel.font = [UIFont fontWithName:@"georgia" size:14];
    _idLabel.layer.masksToBounds = YES;
    _idLabel.layer.cornerRadius = 3;
    
    
    _avatarImage.frame = CGRectMake(8,10.5, 68, 68);
    
    _avatarImage.layer.masksToBounds =YES;  //圆角
    
    _avatarImage.layer.cornerRadius =20;   //圆角
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
