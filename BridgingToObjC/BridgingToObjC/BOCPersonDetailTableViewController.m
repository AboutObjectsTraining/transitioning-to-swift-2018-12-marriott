//
// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
#import "BOCPersonDetailTableViewController.h"
#import "BOCPet.h"

// Import our own module's Swift headers
//
#import "BridgingToObjC-Swift.h"

@interface BOCPersonDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *petNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *petTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *petToysLabel;
@property (weak, nonatomic) IBOutlet UILabel *moodLabel;
@end


@implementation BOCPersonDetailTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.nameLabel.text = self.person.fullName;
    self.moodLabel.text = self.person.moodText;
    self.petNameLabel.text = self.person.pet.name;
    self.petTypeLabel.text = self.person.petTypeText;
    self.petToysLabel.text = self.person.petToysText;
}

@end
