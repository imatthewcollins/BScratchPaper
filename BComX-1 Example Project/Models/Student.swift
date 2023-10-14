//
//  Student.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 14/10/2023.
//

import Foundation

struct Student: Identifiable, Hashable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var majorSport: String
    var numberOfEws: Int = 0
}
