//
//  StudentViewModel.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 14/10/2023.
//

import Foundation

class StudentViewModel: ObservableObject {
    static let shared = StudentViewModel()
    
    @Published var sampleData = [Student(firstName: "Joe", lastName: "Bloggs", majorSport: "Football"), Student(firstName: "John", lastName: "Doe", majorSport: "Rugby"), Student(firstName: "Sheila", lastName: "Jones", majorSport: "Rowing")]
    
    private init() {
        
    }
}
