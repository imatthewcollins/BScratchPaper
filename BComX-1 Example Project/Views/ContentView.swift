//
//  ContentView.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 04/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userViewModel = UserViewModel.shared
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, \(userViewModel.formalName)!")
                
                if userViewModel.userSubject.count == 0 {
                    Text("No subject entered")
                }
                else {
                    Text("Your subject is \(userViewModel.userSubject)")
                    
                }
                NavigationLink {
                    SubjectView(userViewModel: self.userViewModel)
                } label: {
                    Text("Go to subject view ->")
                }
                
                NavigationLink {
                    GenerateJokeView()
                } label: {
                    Text("Generate a joke")
                }

                NavigationLink {
                    TodoListView()
                } label: {
                    Text("Todo List")
                }
            }
            .navigationTitle("Home Page")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
