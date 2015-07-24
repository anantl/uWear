//
//  EditViewController.h
//  uWear
//
//  Created by Ananth L on 24/07/15.
//  Copyright (c) 2015 Ananth L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController 
@property (strong, nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic, retain) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic, retain) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (weak, nonatomic) IBOutlet UIImageView *largeImg;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonCollection;
@property (strong, retain) NSManagedObject * resObj;
@property (weak, nonatomic) NSString * catNew;
@property (strong, nonatomic) NSString * typeNew;
@property (weak, nonatomic) IBOutlet UIButton *officeSlct;
@property (weak, nonatomic) IBOutlet UIButton *casualSlct;
@property (weak, nonatomic) IBOutlet UIButton *partySlct;
@property (weak, nonatomic) IBOutlet UIButton *topSlct;
@property (weak, nonatomic) IBOutlet UIButton *bottomSlct;

- (IBAction)botSlct:(id)sender;
- (IBAction)toSlct:(id)sender;
- (IBAction)parSlct:(id)sender;
- (IBAction)casSlct:(id)sender;
- (IBAction)offSlct:(id)sender;
- (IBAction)delImg:(id)sender;
- (IBAction)Done:(id)sender;
@end
