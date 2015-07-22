//
//  ViewController.m
//  uWear
//
//  Created by Ananth L on 22/07/15.
//  Copyright (c) 2015 Ananth L. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shirtView.image = [UIImage imageNamed:[NSString stringWithFormat:@"sh%d.jpg", ((arc4random() % 2))]];
    
    self.pntsView.image = [UIImage imageNamed:[NSString stringWithFormat:@"pt%d.jpg", ((arc4random() % 2))]];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rfrsh:(id)sender {
    self.shirtView.image = [UIImage imageNamed:[NSString stringWithFormat:@"sh%d.jpg", ((arc4random() % 2))]];
    
    self.pntsView.image = [UIImage imageNamed:[NSString stringWithFormat:@"pt%d.jpg", ((arc4random() % 2))]];
}
@end
