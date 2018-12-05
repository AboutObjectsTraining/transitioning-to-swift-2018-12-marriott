//
// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
#import "BOCMasterTableViewController.h"

// Module import for SwiftComponents framework
@import SwiftComponents;


NSString *BOCRowNumberText(NSIndexPath *indexPath) {
    return [NSString stringWithFormat:@"Row %@", @(indexPath.row + 1)];
}

@implementation BOCMasterTableViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SCODetailTableViewController *controller = segue.destinationViewController;
    controller.text = BOCRowNumberText(self.tableView.indexPathForSelectedRow);
}

@end


@implementation BOCMasterTableViewController (DataSource)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MasterCell"];
    cell.textLabel.text = BOCRowNumberText(indexPath);
    return cell;
}

@end
