//
//  ContentView.swift
//  ToDoList
//
//  Created by Hieu Le on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) private var todos: FetchedResults<Todo>
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
