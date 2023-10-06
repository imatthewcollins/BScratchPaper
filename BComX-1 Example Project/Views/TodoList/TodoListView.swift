//
//  TodoListView.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 06/10/2023.
//

import SwiftUI

struct TodoListView: View {
    
    @ObservedObject private var todoViewModel = TodoViewModel.shared
    
    var body: some View {
        List {
            Section {
                ForEach($todoViewModel.todos) { $todo in
                    TodoView(todo: $todo)
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let todo = todoViewModel.todos[index]
                        todoViewModel.deleteTodo(todo)
                    }
                }
            } header: {
                Text("Todos")
            }
        }
        .navigationTitle("Your todos")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    todoViewModel.toggleAddTodoSheet()
                } label: {
                    Text("Add")
                }
            }
        }
        .sheet(isPresented: $todoViewModel.isSheetVisible) {
            AddNewTodoView()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
