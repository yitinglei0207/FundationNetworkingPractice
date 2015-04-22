//
//  NSDictionary+CheckNull.m
//  FundationNetworkingPractice
//
//  Created by Jason Lei on 2015/4/15.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import "NSDictionary+CheckNull.h"

@implementation NSDictionary (CheckNull)

- (BOOL)checkNullForKey:(NSString *)key{
    return [self objectForKey:key] && [self objectForKey:key] != [NSNull null];
}

@end
