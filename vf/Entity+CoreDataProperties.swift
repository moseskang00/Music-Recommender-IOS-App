//
//  Entity+CoreDataProperties.swift
//  vf
//
//  Created by Moses Kang on 11/29/20.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var prevGenre: String?
    @NSManaged public var prevArtist: String?

}

extension Entity : Identifiable {

}
