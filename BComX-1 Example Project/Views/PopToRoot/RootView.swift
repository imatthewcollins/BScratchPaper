//
//  RootView.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 14/10/2023.
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var navigationManager = NavigationManager.shared
    @ObservedObject var studentViewModel = StudentViewModel.shared
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            List {
                ForEach(studentViewModel.sampleData) { student in
                    NavigationLink(student.firstName, value: student)
                }
            }
            Text("This is the path count: \(navigationManager.path.count)")
            .navigationDestination(for: Student.self) { student in
                StudentView(student: student)
            }
            .navigationTitle("Root View")
        }
        .navigationTitle("Navigation Stack")
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
