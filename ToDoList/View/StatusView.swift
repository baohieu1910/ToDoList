//
//  StatusView.swift
//  ToDoList
//
//  Created by Hieu Le on 12/29/23.
//

import SwiftUI

struct StatusView: View {
    var status: TodoStatus
    
    var body: some View {
        let backgroundColor: Color = {
            switch status {
            case .pending:
                return Color.orange
            case .completed:
                return Color.green
            }
        }()
        
        Text(status == .completed ? "Completed" : "Pending")
            .font(.footnote)
            .foregroundColor(.white)
            .padding(8)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}

//struct StatusView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatusView()
//    }
//}
