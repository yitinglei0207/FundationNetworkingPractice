//
//  DataTableViewCell.h
//  FundationNetworkingPractice
//
//  Created by Jason Lei on 2015/4/15.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *projectName;
@property (weak, nonatomic) IBOutlet UILabel *district;
@property (weak, nonatomic) IBOutlet UILabel *area;
@property (weak, nonatomic) IBOutlet UILabel *stage;

@end
