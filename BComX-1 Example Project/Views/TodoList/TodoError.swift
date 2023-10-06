//
//  TodoError.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 06/10/2023.
//

import SwiftUI

struct TodoError: View {
    
    @ObservedObject private var todoViewModel = TodoViewModel.shared
    
    var body: some View {
        if let error = todoViewModel.addTodoError {
            Text("\(error)")
                .foregroundColor(.red)
        }
    }
}

struct TodoError_Previews: PreviewProvider {
    static var previews: some View {
        TodoError()
    }
}
