//
//  SetStudentEwView.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 14/10/2023.
//

import SwiftUI

struct SetStudentEwView: View {
    
    @ObservedObject var navigationManager = NavigationManager.shared
    @State var student: Student
    
    var body: some View {
        VStack {
            Text("This will be EW #\(student.numberOfEws + 1)")
            Button {
                student.numberOfEws += 1
                navigationManager.popToRoot()
            } label: {
                Text("Save and go to root view")
            }
            Text("This is the path count: \(navigationManager.path.count)")

            
        }
        .navigationTitle("Set EW")
    }
}
