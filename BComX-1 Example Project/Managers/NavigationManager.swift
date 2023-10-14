//
//  NavigationManager.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 14/10/2023.
//

import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    static let shared = NavigationManager()
    
    @Published var path: NavigationPath
    
    private init() {
        path = NavigationPath()
    }
    
    func popToRoot() {
        path = NavigationPath()
    }

}
