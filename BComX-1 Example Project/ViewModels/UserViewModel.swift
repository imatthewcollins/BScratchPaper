//
//  UserViewModel.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 04/10/2023.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User
    @Published var userSubject: String = ""
    
    var formalName: String {
        return "\(user.isTeacher ? "Mr" : "") \(user.lastName)"
    }
    
    static let shared = UserViewModel()
    
    private init() {
        user = User(firstName: "Matthew", lastName: "Collins", isTeacher: true)
    }
}
