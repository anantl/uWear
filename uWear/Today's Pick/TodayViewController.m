//
//  TodayViewController.m
//  Today's Pick
//
//  Created by Ananth L on 24/07/15.
//  Copyright (c) 2015 Ananth L. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableURLRequest *req1 = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://internmbcet.host56.com/fetch_image.php"]];
    
    NSURLResponse *response1 = nil;
    NSError *err1;
    NSData *data1 = [NSURLConnection sendSynchronousRequest:req1 returningResponse:&response1 error:&err1];
    if(err1)
    {
        NSLog(@"Error in connection %@",err1);
    }
    else
    {
        NSArray *testArray = [NSJSONSerialization JSONObjectWithData:data1 options:NSJSONReadingAllowFragments error:&err1];
        NSDictionary *resultsUpdate = testArray[rand()%[testArray count]];
        if(err1)
            NSLog(@"Error in response %@",err1);
        else
        {
            NSData *data = [[NSData alloc]initWithBase64EncodedString:[resultsUpdate valueForKey:@"img"] options:NSDataBase64DecodingIgnoreUnknownCharacters];
            
            UIImage *image = [UIImage imageWithData:data];
            self.top.image=image;
        }
    }
    
    req1 = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://internmbcet.host56.com/fetch_image2.php"]];
    err1=nil;
    response1 = nil;
    data1 = [NSURLConnection sendSynchronousRequest:req1 returningResponse:&response1 error:&err1];
    if(err1)
    {
        NSLog(@"Error in connection %@",err1);
    }
    else
    {
        NSArray *testArray = [NSJSONSerialization JSONObjectWithData:data1 options:NSJSONReadingAllowFragments error:&err1];
        NSDictionary *resultsUpdate = testArray[rand()%[testArray count]];
        if(err1)
            NSLog(@"Error in response %@",err1);
        else
        {
            NSData *data = [[NSData alloc]initWithBase64EncodedString:[resultsUpdate valueForKey:@"img"] options:NSDataBase64DecodingIgnoreUnknownCharacters];
            
            UIImage *image = [UIImage imageWithData:data];
            self.top.image=image;
        }
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (IBAction)rfrsh:(id)sender {
    [self viewDidLoad];
}
@end
