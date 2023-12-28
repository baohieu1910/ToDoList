//
//  DetailView.swift
//  ToDoList
//
//  Created by Hieu Le on 12/28/23.
//

import SwiftUI

struct DetailView: View {
    @State var isShowEditForm: Bool = false
    var todo: Todo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(todo.title ?? "")
                .font(.title3)
            Text(formatDate(todo.date ?? Date()))
                .font(.subheadline)
                .foregroundColor(.gray)
            StatusView(status: todo.status == "completed" ? .completed : .pending)
        }
        .padding()
        .navigationTitle("Todo details")
        .toolbar {
            Button("Edit") {
                isShowEditForm.toggle()
            }
        }
        .sheet(isPresented: $isShowEditForm) {
            InputFormView(isPresented: $isShowEditForm)
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    var todo: To
//    static var previews: some View {
//        DetailView()
//    }
//}
