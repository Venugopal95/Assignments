//
//  College+CoreDataProperties.swift
//  CoreDataAssign
//
//  Created by Venugopal on 01/09/17.
//  Copyright © 2017 Venugopal. All rights reserved.
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var collegeName: String?
    @NSManaged public var collegeId: String?

}
