//
//  EditViewController.m
//  uWear
//
//  Created by Ananth L on 24/07/15.
//  Copyright (c) 2015 Ananth L. All rights reserved.
//

#import "EditViewController.h"
#import "AppDelegate.h"
#import "WardrobeViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize resObj;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.managedObjectContext = [appDelegate managedObjectContext];
    
    UIImage *newImage;
    newImage = [UIImage imageWithData:[self.resObj valueForKey:@"pic"]];
    self.largeImg.image=newImage;
    self.catNew = [self.resObj valueForKey:@"cat"];
    self.typeNew = [self.resObj valueForKey:@"type"];
    
    if([[self.resObj valueForKey:@"cat"]  isEqual: @"office"])
    {
        self.officeSlct.alpha = 1;
        self.casualSlct.alpha = .4;
        self.partySlct.alpha = .4;
    }
    
    else if([[self.resObj valueForKey:@"cat"]  isEqual: @"party"])
    {
        self.partySlct.alpha = 1;
        self.casualSlct.alpha = .4;
        self.officeSlct.alpha = .4;
    }
       
    else if([[self.resObj valueForKey:@"cat"]  isEqual: @"casual"])
    {
        self.casualSlct.alpha = 1;
        self.officeSlct.alpha = .4;
        self.partySlct.alpha = .4;
          }
          
    if([[self.resObj valueForKey:@"type"]  isEqual: @"top"])
    {
        self.topSlct.alpha = 1;
        self.bottomSlct.alpha = .4;
    }
     
    else if([[self.resObj valueForKey:@"type"]  isEqual: @"bottom"])
    {
        self.topSlct.alpha = .4;
        self.bottomSlct.alpha = 1;
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)botSlct:(id)sender {
    self.topSlct.alpha = .4;
    self.bottomSlct.alpha = 1;
    self.typeNew=@"bottom";
}

- (IBAction)toSlct:(id)sender {
    self.topSlct.alpha = 1;
    self.bottomSlct.alpha = .4;
    self.typeNew=@"top";
}

- (IBAction)parSlct:(id)sender {
    self.partySlct.alpha = 1;
    self.casualSlct.alpha = .4;
    self.officeSlct.alpha = .4;

    self.catNew=@"party";
}

- (IBAction)casSlct:(id)sender {
    self.casualSlct.alpha = 1;
    self.officeSlct.alpha = .4;
    self.partySlct.alpha = .4;
    self.catNew=@"casual";
}

- (IBAction)offSlct:(id)sender {
    self.officeSlct.alpha = 1;
    self.casualSlct.alpha = .4;
    self.partySlct.alpha = .4;
    self.catNew=@"office";

}

- (IBAction)delImg:(id)sender {
    [self.managedObjectContext deleteObject:self.resObj];
    
    NSError *deleteError = nil;
    
    if (![self.resObj.managedObjectContext save:&deleteError]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", deleteError, deleteError.localizedDescription);
    }
    
    [self dismissViewControllerAnimated:NO completion:NULL];

}

- (IBAction)Done:(id)sender {
    [self.resObj setValue:self.typeNew forKey:@"type"];
    [self.resObj setValue:self.catNew forKey:@"cat"];
    
    NSError *saveError = nil;
    
    if (![self.resObj.managedObjectContext save:&saveError]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", saveError, saveError.localizedDescription);
    }
    [self dismissViewControllerAnimated:NO completion:NULL];
}
@end
