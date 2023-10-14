//
//  StudentView.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 14/10/2023.
//

import SwiftUI

struct StudentView: View {
    
    @ObservedObject var navigationManager = NavigationManager.shared
    @ObservedObject var studentViewModel = StudentViewModel.shared
    @State var student: Student

    var body: some View {
        VStack {
            Text("Name: \(student.firstName) \(student.lastName)")
            Text("Major Sport: \(student.majorSport)")
            NavigationLink("Set \(student.firstName) some EW", value: student.numberOfEws)
            Text("This is the path count: \(navigationManager.path.count)")
        }
        .navigationDestination(for: Int.self) { _ in
            SetStudentEwView(student: student)
        }
        .navigationTitle("Student Details")
    }
}
