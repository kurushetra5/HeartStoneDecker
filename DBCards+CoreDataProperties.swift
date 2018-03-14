//
//  DBCards+CoreDataProperties.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 14/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//
//

import Foundation
import CoreData


extension DBCards {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBCards> {
        return NSFetchRequest<DBCards>(entityName: "DBCards")
    }

    @NSManaged public var atack: Int32
    @NSManaged public var cost: Int32
    @NSManaged public var health: Int32
    @NSManaged public var imageLink: String?
    @NSManaged public var name: String?
    @NSManaged public var theClass: String?
    @NSManaged public var type: String?
    @NSManaged public var webImageLink: String?

}
