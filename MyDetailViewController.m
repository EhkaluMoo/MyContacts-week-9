//
//  MyDetailViewController.m
//  MyContacts
//
//  Created by webstudent on 10/13/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import "MyDetailViewController.h"

@interface MyDetailViewController ()

@end

@implementation MyDetailViewController

@synthesize contactdb;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.contactdb) {
        [self.fullname setText:[self.contactdb valueForKey:@"fullname"]];
        [self.address setText:[self.contactdb valueForKey:@"address"]];
        [self.phone setText:[self.contactdb valueForKey:@"phone"]];
         [self.fax setText:[self.contactdb valueForKey:@"fax"]];
         [self.email setText:[self.contactdb valueForKey:@"email"]];
        
    }
}
- (NSManagedObjectContext *)managedObjectContext { NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext]; }
    return context; }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    if (self.contactdb) {
        // Update existing device
        [self.contactdb setValue:self.fullname.text forKey:@"fullname"];
        [self.contactdb setValue:self.address.text forKey:@"address"];
        [self.contactdb setValue:self.phone.text forKey:@"phone"];
        [self.contactdb setValue:self.fax.text forKey:@"fax"];
        [self.contactdb setValue:self.email.text forKey:@"email"];
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription
                                      insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:context];
                                        [newDevice setValue:self.fullname.text forKey:@"fullname"];
                                        [newDevice setValue:self.address.text forKey:@"address"];
                                        [newDevice setValue:self.phone.text forKey:@"phone"];
                                          [newDevice setValue:self.fax.text forKey:@"fax"];
                                            [newDevice setValue:self.email.text forKey:@"email"];
    }
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
   
[self dismissViewControllerAnimated:YES completion:nil];
}

@end
