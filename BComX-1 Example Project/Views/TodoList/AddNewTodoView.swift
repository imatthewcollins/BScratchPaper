//
//  AddNewTodoView.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 06/10/2023.
//

import SwiftUI

struct AddNewTodoView: View {
    
    @ObservedObject private var todoViewModel = TodoViewModel.shared
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $todoViewModel.newTodo.title)
                Toggle("Is Completed", isOn: $todoViewModel.newTodo.isCompleted)
                
                TodoError()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        todoViewModel.addTodo()
                    } label: {
                        Text("Save")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        todoViewModel.toggleAddTodoSheet()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
            .interactiveDismissDisabled()
        }
    }
}

struct AddNewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTodoView()
    }
}
