//
//  DataManager.swift
//  ToDoList
//
//  Created by Hieu Le on 12/27/23.
//

import Foundation
import CoreData

class DataManager: NSObject, ObservableObject {
    @Published var todos = [Todo]()
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "Todolist")
    
    override init() {
        super.init()
        container.loadPersistentStores { _, _ in
            
        }
    }
}
