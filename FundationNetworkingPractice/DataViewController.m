//
//  ViewController.m
//  FundationNetworkingPractice
//
//  Created by Jason Lei on 2015/4/15.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import "DataViewController.h"
#import "DataTableViewCell.h"
#import "NSDictionary+CheckNull.h"

@interface DataViewController ()

@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,strong) UIRefreshControl *dataRefresher;

@end

@implementation DataViewController
// http://data.taipei.gov.tw/opendata/apply/NewDataContent;jsessionid=3A72E7293456D38F190F78FD2EBDC802?oid=683965F5-7E23-4134-ADB1-99C4FB1EA517
#define kOpenDataParkAPI  @"http://data.taipei.gov.tw/opendata/apply/json/NkZBQ0E0MEEtNDU4Mi00NTI4LTkzMDgtRjBCQzUyQkEwODY4"

- (void)awakeFromNib{
    _dataArray = [[NSMutableArray alloc]init];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataRefresher = [[UIRefreshControl alloc]init];
    [_dataRefresher addTarget:self action:@selector(prepareAPIcall) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_dataRefresher];
    [self prepareAPIcall];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareAPIcall{
    //prepare loading
    [_dataRefresher beginRefreshing];
    //prepare API
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:kOpenDataParkAPI]cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        [_dataRefresher endRefreshing];
        
        // Check if have error.
        if (!connectionError) {
            NSError *jsonSerializationError;
            
            // Serialize data into JSONObject.
        
            
            if ([[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonSerializationError] isKindOfClass:[NSArray class]]) {
                
                NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonSerializationError];
                
                // Remove all previous data.
                [_dataArray removeAllObjects];
                
                // Add all data into info array.
                [_dataArray addObjectsFromArray:jsonArray];
                
                // Reload Table View.
                [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
            
            
        } else {
            NSLog(@"Connection with: %@", connectionError);
        }
    }];
     

}

#pragma mark - Table view data source

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dataCell" forIndexPath:indexPath];
    NSDictionary *receivedData = [_dataArray objectAtIndex:indexPath.row];
    
    if ([receivedData checkNullForKey:@"District"]) {
        cell.district.text = [receivedData objectForKey:@"District"];
    }
    if ([receivedData checkNullForKey:@"Project Name"]) {
        cell.projectName.text = [receivedData objectForKey:@"Project Name"];
    }
    if ([receivedData checkNullForKey:@"Stage of Urban Renewal"]) {
        cell.stage.text = [receivedData objectForKey:@"Stage of Urban Renewal"];
    }
    if ([receivedData checkNullForKey:@"Area of City-Owned Land"]) {
        cell.area.text = [receivedData objectForKey:@"Area of City-Owned Land"];
    }
    return cell;
}
@end
