//
//  SubjectView.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 04/10/2023.
//

import SwiftUI

struct SubjectView: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    var body: some View {
        TextField("Enter your A-Level Subject", text: $userViewModel.userSubject)
            .padding()
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(userViewModel: UserViewModel.shared)
    }
}
