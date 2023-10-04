//
//  JokeManager.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 04/10/2023.
//

import Foundation

class JokeManager: ObservableObject {
    
    @Published var joke: Joke
    
    init() {
        self.joke = Joke(setup: "", punchline: "")
    }
    
    func generateJoke() async {
        print("generating joke")
        guard let url = URL(string: "https://official-joke-api.appspot.com/random_joke") else {
            print("Invalid URL")
            return
        }
        
        do {
            print("getting data from api")
            let (data, _) = try await URLSession.shared.data(from: url)
            print("got data")
            if let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data) {
                print(decodedResponse)
                DispatchQueue.main.async {
                    self.joke = Joke(setup: "\(decodedResponse.setup)", punchline: "\(decodedResponse.punchline)")
                }
            }
            else {
                print("failed to decode")
            }
        }
        catch {
            print("Invalid data")
        }
    }
}
