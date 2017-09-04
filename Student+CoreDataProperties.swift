//
//  Student+CoreDataProperties.swift
//  CoreDataAssign
//
//  Created by Venugopal on 01/09/17.
//  Copyright © 2017 Venugopal. All rights reserved.
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: String?

}
