//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit


@objc (BOCPersonsTableViewController) class PersonsTableViewController: UITableViewController
{
    @IBOutlet var dataSource: PersonDataSource?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailController = segue.destination as? BOCPersonDetailTableViewController,
            let indexPath = tableView?.indexPathForSelectedRow else { return }
        
        detailController.person = dataSource?.person(at: indexPath)
    }
}
