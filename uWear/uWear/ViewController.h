//
//  ViewController.h
//  uWear
//
//  Created by Ananth L on 22/07/15.
//  Copyright (c) 2015 Ananth L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *shirtView;
@property (weak, nonatomic) IBOutlet UIImageView *pntsView;
@property (weak, nonatomic) IBOutlet UIButton *refresh;
- (IBAction)rfrsh:(id)sender;


@end

