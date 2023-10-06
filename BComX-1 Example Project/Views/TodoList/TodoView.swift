//
//  TodoView.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 06/10/2023.
//

import SwiftUI

struct TodoView: View {
    
    @Binding var todo: TodoItem
    @ObservedObject private var todoViewModel = TodoViewModel.shared
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(todo.title)")
                    .bold()
                Text("Id: \(todo.id)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            Button {
                todoViewModel.toggleTodoCompletion(todo: self.todo)
            } label: {
                Image(systemName: "\(todo.isCompleted ? "checkmark.circle.fill" : "circle")")
            }
        }
    }
}
