//
//  ContentView.swift
//  ToDoList
//
//  Created by Hieu Le on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: []) private var todos: FetchedResults<Todo>
    
    @State var searchKeyword: String = ""
    @State var isSheetPresented: Bool = false
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(todos, id: \.self) { todo in
                        NavigationLink(destination: DetailView(todo: todo)) {
                            HStack(alignment: .center) {
                                VStack(alignment: .leading) {
                                    Text(todo.title ?? "")
                                        .font(.title3)
                                    Text(formatDate(todo.date ?? Date()))
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                StatusView(status: todo.status == "completed" ? .completed : .pending)
                            }
                        }
                    }
                    .onDelete(perform: delete)
                }
                .listStyle(.inset)
                .padding()
                .navigationTitle("Todo List")
                .searchable(text: $searchKeyword)
                .onChange(of: searchKeyword) { newValue in
                    self.todos.nsPredicate = newValue.isEmpty ? nil : NSPredicate(format: "title CONSTANT %@", newValue)
                }
                .sheet(isPresented: $isSheetPresented) {
                    InputFormView(isPresented: $isSheetPresented)
                }
                .toolbar {
                    Button("Add") {
                        isSheetPresented.toggle()
                    }
                }
            }
        }
        .padding()
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            self.viewContext.delete(todo)
            do {
                try viewContext.save()
                print("Deleted")
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
