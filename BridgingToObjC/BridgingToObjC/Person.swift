//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import Foundation

class Person: NSObject
{
    @objc var firstName: String?
    @objc var lastName: String?
    @objc var pet: Pet?
    
    @objc var mood: Mood = .cheerful
    
    @objc func changeMood() {
        mood = Mood(rawValue: Int(arc4random_uniform(5))) ?? .cheerful
    }
    
    @objc init(firstName: String? = nil, lastName: String? = nil, pet: Pet? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.pet = pet
        super.init()
    }
}


extension Person
{
    private var fName: String? {
        if let first = firstName, first == "" { return nil }
        return firstName
    }
    private var lName: String? {
        if let last = lastName, last == "" { return nil }
        return lastName
    }
    @objc var fullName: String {
        switch (fName, lName) {
        case let (first?, last?): return "\(last), \(first)"
        case let (first?, _):     return first
        case let (_, last?):      return last
        default:                  return "Unknown"
        }
    }
    
    @objc var petDescription: String {
        guard let pet = pet else { return "None" }
        return "\(pet.name) (\(pet.type)), toys: \(pet.toys)"
    }
}

// MARK: - Flattened attribute values

extension String {
    static let empty = ""
    static let delimiter = ", "
}

extension Person
{
    @objc var petTypeText: String? {
        return pet?.type.description
    }
    
    @objc var petToysText: String? {
        return pet?.toys.reduce(String.empty) {
            let delimiter = $0.isEmpty ? String.empty : String.delimiter
            // `name` property visible here because `toys` property bridged as `[Toy]`
            return "\($0)\(delimiter)\($1.name.capitalized)"
        }
    }
    
    @objc var moodText: String? {
        return mood.description
    }
}

extension PetType: CustomStringConvertible
{
    public var description: String {
        switch self {
        case .dog:   return "Dog"
        case .cat:   return "Cat"
        case .other: return "Other"
        }
    }
}

// Swift can bridge only those protocols declared with `@objc`.
//
@objc enum Mood: Int, CustomStringConvertible {
    case cheerful
    case fair
    
    // Use `@objc()` for identifiers that can't be translated to ObjC
    @objc (MoodAnnoyed) case 😡
    @objc (MoodGrim) case 💀
    
    var description: String {
        switch self {
        case .cheerful: return "😀"
        case .fair: return "😐"
        case .😡: return "😡"
        case .💀: return "💀"
        }
    }
}
