//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Hieu Le on 12/27/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject private var manager: DataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
