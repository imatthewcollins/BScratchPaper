//
//  ContentView.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 04/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userViewModel = UserViewModel.shared
    @ObservedObject private var navigationManager = NavigationManager.shared
    
    var body: some View {
        NavigationView {
            List {
                
                NavigationLink {
                    SharingObjectDataExampleView()
                } label: {
                    Text("Share objects between views")
                }
                
                NavigationLink {
                    GenerateJokeView()
                } label: {
                    Text("Handle APIs")
                }

                NavigationLink {
                    TodoListView()
                } label: {
                    Text("Persist data")
                }
                
                NavigationLink {
                    RootView()
                } label: {
                    Text("Pop to a root view")
                }
            }
            .navigationTitle("Hello, \(userViewModel.formalName)!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
