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
@property (weak, nonatomic) NSString *srchType;
@property (weak, nonatomic) NSString *saveType;
@property (weak, nonatomic) NSString *saveCat;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonCollection;
@property (weak, nonatomic) IBOutlet UIButton *bottomSlct;
@property (weak, nonatomic) IBOutlet UIButton *topSlct;
@property (weak, nonatomic) IBOutlet UIButton *partySlct;
@property (weak, nonatomic) IBOutlet UIButton *casualSlct;
@property (weak, nonatomic) IBOutlet UIButton *officeSlct;
@property (weak, nonatomic) IBOutlet UILabel *topEmpty;
@property (weak, nonatomic) IBOutlet UILabel *bottomEmpty;
@property (weak, nonatomic) IBOutlet UIButton *offMainBtn;
@property (weak, nonatomic) IBOutlet UIButton *parMainBtn;
@property (weak, nonatomic) IBOutlet UIButton *casMainBtn;
- (IBAction)offClck:(id)sender;
- (IBAction)casClck:(id)sender;
- (IBAction)parClck:(id)sender;
- (IBAction)topClck:(id)sender;
- (IBAction)botClck:(id)sender;
- (IBAction)offSrch:(id)sender;
- (IBAction)parSrch:(id)sender;
- (IBAction)casSrch:(id)sender;

- (IBAction)rfrsh:(id)sender;
- (IBAction)imagePicker:(id)sender;
- (IBAction)savePicker:(id)sender;
- (IBAction)cancelPicker:(id)sender;
@end

