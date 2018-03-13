//
//  DBCard+CoreDataProperties.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 12/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//
//

import Foundation
import CoreData


extension DBCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DBCard> {
        return NSFetchRequest<DBCard>(entityName: "DBCard")
    }

    @NSManaged public var atack: String?
    @NSManaged public var cost: String?
    @NSManaged public var health: String?
    @NSManaged public var imageLink: String?
    @NSManaged public var name: String?
    @NSManaged public var theClass: String?
    @NSManaged public var type: String?
    @NSManaged public var webImageLink: String?

}
