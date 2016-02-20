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
@synthesize urlLabel = _urlLabel;
@synthesize avatarImage =_avatarImage;


- (void)awakeFromNib
{
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
