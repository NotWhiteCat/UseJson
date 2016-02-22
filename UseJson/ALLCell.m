//
//  ALLCell.m
//  UseJson
//
//  Created by kaiser on 16/2/21.
//  Copyright © 2016年 kaiser. All rights reserved.
//

#import "ALLCell.h"

@implementation ALLCell

@synthesize newidLabel = _newidLabel;
@synthesize newtitleLabel = _newtitleLabel;
@synthesize newavatarImage =_newavatarImage;


- (void)awakeFromNib
{
    // Initialization code
    
    _newidLabel.font = [UIFont fontWithName:@"georgia" size:14];
    _newidLabel.layer.masksToBounds = YES;
    _newidLabel.layer.cornerRadius = 3;
    
    
    _newavatarImage.frame = CGRectMake(8,10.5, 68, 68);
    
    _newavatarImage.layer.masksToBounds =YES;  //圆角
    
    _newavatarImage.layer.cornerRadius =20;   //圆角
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
