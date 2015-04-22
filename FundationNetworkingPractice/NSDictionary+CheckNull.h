//
//  NSDictionary+CheckNull.h
//  FundationNetworkingPractice
//
//  Created by Jason Lei on 2015/4/15.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CheckNull)
- (BOOL)checkNullForKey:(NSString *)key;

@end
