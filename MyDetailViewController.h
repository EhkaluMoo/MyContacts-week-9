//
//  MyDetailViewController.h
//  MyContacts
//
//  Created by webstudent on 10/13/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDetailViewController : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *fullname;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *fax;
@property (strong, nonatomic) IBOutlet UITextField *email;
- (IBAction)Back:(id)sender;
- (IBAction)Save:(id)sender;

@property (strong) NSManagedObject *contactdb;

@end
