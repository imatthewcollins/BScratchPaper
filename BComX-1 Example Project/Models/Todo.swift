//
//  Todo.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 06/10/2023.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted = false
    
}
