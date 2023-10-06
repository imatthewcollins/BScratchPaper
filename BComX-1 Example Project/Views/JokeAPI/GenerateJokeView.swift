//
//  GenerateJokeView.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 04/10/2023.
//

import SwiftUI

struct GenerateJokeView: View {
    
    @StateObject var jokeManager = JokeManager()
    
    var body: some View {
        VStack {
            
            Text("\(jokeManager.joke.setup)")
            Text("\(jokeManager.joke.punchline)")
            
            Button {
                print("button pressed")
                Task {
                    await jokeManager.generateJoke()
                }
            } label: {
                Text("Generate a joke!")
            }
        }
        .navigationTitle("Joke Generator")
    }
}

struct GenerateJokeView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateJokeView()
    }
}
