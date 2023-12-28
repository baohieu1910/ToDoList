//
//  InputFormView.swift
//  ToDoList
//
//  Created by Hieu Le on 12/28/23.
//

import SwiftUI

struct InputFormView: View {
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var isPresented: Bool
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var status: TodoStatus = .pending
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter todo title", text: $title)
                } header: {
                    Text("Title")
                }
                
                Section {
                    DatePicker("Select a date", selection: $date, displayedComponents: .date)
                } header: {
                    Text("Date")
                }
                
                Section {
                    Picker("Select status", selection: $status) {
                        ForEach(TodoStatus.allCases, id: \.self) { status in
                            Text(status.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                } header: {
                    Text("Status")
                }
            }
            .navigationTitle("New todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        self.saveTodo(title: title, date: date, status: status.rawValue)
                        isPresented = false
                    }
                }
            }
        }
    }
    
    func saveTodo(title: String, date: Date, status: String) {
        var todo = Todo(context: self.viewContext)
        todo.id = UUID()
        todo.title = title
        todo.date = date
        todo.status = status
        
        do {
            try self.viewContext.save()
            print("Saved")
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}

//struct InputFormView_Previews: PreviewProvider {
//    @EnvironmentObject var manager: DataManager
//    @Environment(\.managedObjectContext) var viewContext
//
//    static var previews: some View {
//        InputFormView()
//    }
//}
