//
//  SharingObjectDataExampleView.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 06/10/2023.
//

import SwiftUI

struct SharingObjectDataExampleView: View {
    
    @ObservedObject private var userViewModel = UserViewModel.shared
    
    
    var body: some View {
        VStack {
            if userViewModel.userSubject.count == 0 {
                Text("No subject entered")
            }
            else {
                Text("Your subject is \(userViewModel.userSubject)")
            }
            
            NavigationLink {
                SubjectView(userViewModel: self.userViewModel)
            } label: {
                Text("Go to subject view")
            }
        }
        .navigationTitle("Sharing Objects")
    }
}

struct SharingObjectDataExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SharingObjectDataExampleView()
    }
}
