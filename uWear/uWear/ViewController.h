//
//  ViewController.h
//  uWear
//
//  Created by Ananth L on 22/07/15.
//  Copyright (c) 2015 Ananth L. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *shirtView;
@property (weak, nonatomic) IBOutlet UIImageView *pntsView;
@property (weak, nonatomic) IBOutlet UIButton *refresh;
@property (weak, nonatomic) IBOutlet UIImageView *imgPkd;
@property (weak, nonatomic) IBOutlet UIButton *svBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (IBAction)rfrsh:(id)sender;
- (IBAction)imagePicker:(id)sender;
- (IBAction)savePicker:(id)sender;
- (IBAction)cancelPicker:(id)sender;
@end

