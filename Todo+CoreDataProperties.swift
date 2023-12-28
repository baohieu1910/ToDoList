//
//  Todo+CoreDataProperties.swift
//  ToDoList
//
//  Created by Hieu Le on 12/27/23.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var status: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?

}

extension Todo : Identifiable {

}
