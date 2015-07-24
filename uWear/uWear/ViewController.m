//
//  ViewController.m
//  uWear
//
//  Created by Ananth L on 22/07/15.
//  Copyright (c) 2015 Ananth L. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "WardrobeCollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.svBtn setHidden:YES];
    [self.cancelBtn setHidden:YES];
    [self.imgPkd setHidden:YES];
    [self.topEmpty setHidden:YES];
    [self.bottomEmpty setHidden:YES];
    for(UIButton *button in self.buttonCollection){
        [button setHidden:YES];
    }
    self.parMainBtn.alpha = .6;
    self.offMainBtn.alpha = .6;
    self.casMainBtn.alpha = 1;
    self.srchType=@"casual";
    [self fetchRandom:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rfrsh:(id)sender {
    [self fetchRandom:self];
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *imgSlct = [info valueForKey:UIImagePickerControllerOriginalImage];
    [self.imgPkd setHidden:NO];
    [self.svBtn setHidden:NO];
    [self.cancelBtn setHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.officeSlct.alpha = .4;
    self.casualSlct.alpha = 1;
    self.partySlct.alpha = .4;
    self.saveCat = @"casual";
    self.topSlct.alpha = 1;
    self.bottomSlct.alpha = .4;
    self.saveType = @"top";
    self.navigationItem.leftBarButtonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem.enabled = NO;
    self.imgPkd.image = imgSlct;
    for(UIButton *button in self.buttonCollection){
        [button setHidden:NO];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)savePicker:(id)sender {
    UIImage *newImg = self.imgPkd.image;
    NSData * imageData = UIImageJPEGRepresentation(newImg, 0.0);
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Clothes" inManagedObjectContext: self.managedObjectContext];
    NSManagedObject *newCloth = [[NSManagedObject alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:self.managedObjectContext];
    [newCloth setValue:imageData forKey:@"pic"];
    [newCloth setValue:self.saveCat forKey:@"cat"];
    [newCloth setValue:self.saveType forKey:@"type"];
    NSError *error = nil;
    
    if (![newCloth.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    [self.svBtn setHidden:YES];
    [self.cancelBtn setHidden:YES];
    [self.imgPkd setHidden:YES];
    for(UIButton *button in self.buttonCollection){
        [button setHidden:YES];
    }
    self.navigationItem.leftBarButtonItem.enabled = YES;
    self.navigationItem.rightBarButtonItem.enabled = YES;
    
}

- (void)fetchRandom:(id)sender {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Clothes"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@ AND %K == %@", @"cat", self.srchType, @"type", @"top"];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
    } else {
        if ([result count] == 0) {
            [self.topEmpty setHidden:NO];
            NSLog(@"Nothing to display on top");
        }
        else {
            [self.topEmpty setHidden:YES];
            UIImage *newImage;
            int randomImgNum = arc4random() % [result count];
            NSManagedObject *newObj = (NSManagedObject *)[result objectAtIndex:randomImgNum];
            newImage = [UIImage imageWithData:[newObj valueForKey:@"pic"]];
            self.shirtView.image=newImage;
        }
    }
    
    fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Clothes"];
    predicate = [NSPredicate predicateWithFormat:@"%K == %@ AND %K == %@", @"cat", self.srchType, @"type", @"bottom"];
    [fetchRequest setPredicate:predicate];
    
    error = nil;
    result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
    } else {
        if ([result count] == 0) {
            [self.bottomEmpty setHidden:NO];
            NSLog(@"Nothing to display on bottom");
        }
        else {
            [self.bottomEmpty setHidden:YES];
            UIImage *newImage;
            int randomImgNum = arc4random() % [result count];
            NSManagedObject *newObj = (NSManagedObject *)[result objectAtIndex:randomImgNum];
            newImage = [UIImage imageWithData:[newObj valueForKey:@"pic"]];
            self.pntsView.image=newImage;
            }

    }
}

- (IBAction)cancelPicker:(id)sender {
    [self.svBtn setHidden:YES];
    [self.cancelBtn setHidden:YES];
    [self.imgPkd setHidden:YES];
    for(UIButton *button in self.buttonCollection){
        [button setHidden:YES];
    }
    self.navigationItem.leftBarButtonItem.enabled = YES;
    self.navigationItem.rightBarButtonItem.enabled = YES;
}


- (IBAction)offClck:(id)sender {
    self.officeSlct.alpha = 1;
    self.casualSlct.alpha = .4;
    self.partySlct.alpha = .4;
    self.saveCat = @"office";
}

- (IBAction)casClck:(id)sender {
    self.officeSlct.alpha = .4;
    self.casualSlct.alpha = 1;
    self.partySlct.alpha = .4;
    self.saveCat = @"casual";
}

- (IBAction)parClck:(id)sender {
    self.officeSlct.alpha = .4;
    self.casualSlct.alpha = .4;
    self.partySlct.alpha = 1;
    self.saveCat = @"party";
}

- (IBAction)topClck:(id)sender {
    self.topSlct.alpha = 1;
    self.bottomSlct.alpha = .4;
    self.saveType = @"top";
}

- (IBAction)botClck:(id)sender {
    self.bottomSlct.alpha = 1;
    self.topSlct.alpha = .4;
    self.saveType = @"bottom";
}

- (IBAction)offSrch:(id)sender {
    self.parMainBtn.alpha = .6;
    self.casMainBtn.alpha = .6;
    self.offMainBtn.alpha = 1;
    self.srchType = @"office";
    self.shirtView.image=nil;
    self.pntsView.image=nil;
    [self fetchRandom:self];
}

- (IBAction)parSrch:(id)sender {
    self.offMainBtn.alpha = .6;
    self.casMainBtn.alpha = .6;
    self.parMainBtn.alpha = 1;
    self.srchType = @"party";
    self.shirtView.image=nil;
    self.pntsView.image=nil;
    [self fetchRandom:self];
}

- (IBAction)casSrch:(id)sender {
    self.parMainBtn.alpha = .6;
    self.offMainBtn.alpha = .6;
    self.casMainBtn.alpha = 1;
    self.srchType = @"casual";
    self.shirtView.image=nil;
    self.pntsView.image=nil;
    [self fetchRandom:self];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toCollection"]) {
        
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
        }
}

@end
