//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

@objc (SCODetailTableViewController)
public class DetailTableViewController: UITableViewController
{
    @objc public var text: String?
    
    @IBOutlet public weak var titleCell: UILabel!
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleCell.text = text
    }
}
