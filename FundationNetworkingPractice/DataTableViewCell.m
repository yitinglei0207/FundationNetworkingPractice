//
//  DataTableViewCell.m
//  FundationNetworkingPractice
//
//  Created by Jason Lei on 2015/4/15.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import "DataTableViewCell.h"

@implementation DataTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //    [self.bodyLabel sizeToFit];
    //    [self.addressLabel sizeToFit];
    //    [self.categoryLabel sizeToFit];
    //    [self.stitleLabel sizeToFit];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
