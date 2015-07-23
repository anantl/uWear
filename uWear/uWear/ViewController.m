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
    
    self.shirtView.image = [UIImage imageNamed:[NSString stringWithFormat:@"cssh%d.jpg", ((arc4random() % 2))]];
    
    self.pntsView.image = [UIImage imageNamed:[NSString stringWithFormat:@"cspt%d.jpg", ((arc4random() % 2))]];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rfrsh:(id)sender {
    self.shirtView.image = [UIImage imageNamed:[NSString stringWithFormat:@"cssh%d.jpg", ((arc4random() % 2))]];
    
    self.pntsView.image = [UIImage imageNamed:[NSString stringWithFormat:@"cspt%d.jpg", ((arc4random() % 2))]];
}

- (IBAction)imagePicker:(id)sender {
    UIImagePickerController *imgpkr = [[UIImagePickerController alloc] init];
    imgpkr.modalPresentationStyle = UIModalPresentationCurrentContext;
    imgpkr.delegate = self;
    [self presentViewController:imgpkr animated:NO completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
