//
//  WardrobeViewController.h
//  uWear
//
//  Created by Ananth L on 24/07/15.
//  Copyright (c) 2015 Ananth L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WardrobeViewController : UICollectionViewController

@property (strong, nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic, retain) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic, retain) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (weak, nonatomic) NSArray *result;
- (IBAction)doneEditing:(id)sender;

@end
