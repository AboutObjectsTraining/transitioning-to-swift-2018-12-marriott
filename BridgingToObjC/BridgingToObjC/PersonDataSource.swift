//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit

@objc (BOCPersonDataSource) class PersonDataSource: NSObject
{
    @objc let spot = Pet(name: "Spot", type: PetType.dog)
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func updateMood(_ sender: Any) {
        for person in persons { person.changeMood() }
        tableView.reloadData()
    }
    
    @objc lazy var persons: [Person] = [
        Person(firstName: "Fred", lastName: "Smith", pet: Pet(name: "Fido", type: .dog)),
        Person(firstName: "Jill", lastName: "Jones", pet: Pet(name: "Leo", type: .cat)),
        Person(firstName: "Jim", lastName: ""),
        Person(firstName: "", lastName: "Lee", pet: Pet(name: "Woofsie", type: .dog)),
        Person(firstName: "Barb", lastName: "Mack", pet: Pet(name: "Pookie", type: .cat)),
        Person(firstName: "Sue", lastName: "Yu")
    ]
    
    @objc public func person(at indexPath: IndexPath) -> Person {
        return persons[indexPath.row]
    }
}

extension PersonDataSource: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") else {
            fatalError("Reuse identifier must be specified in storyboard")
        }
        populate(cell: cell, at: indexPath)
        return cell
    }
}

extension PersonDataSource
{
    @objc func populate(cell: UITableViewCell, at indexPath: IndexPath) {
        cell.textLabel?.text = person(at: indexPath).fullName
        cell.detailTextLabel?.text = "current mood:  \(person(at: indexPath).mood)"
    }
}
