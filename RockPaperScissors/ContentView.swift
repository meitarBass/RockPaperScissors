//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Meitar Basson on 04/07/2022.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var userChoice: Choices
//    @State private var gameResult: Results
    
    private var playerScore: Int = 0
    private var roundNumber: Int = 1
    
    enum Choices: String {
        case rock = "🪨"
        case paper = "🧻"
        case scissors = "✂️"
    }
    
    enum Results: Int {
        case lose
        case tie
        case win
    }
    
    let possibleChoices = [Choices.rock, Choices.paper, Choices.scissors]
    
    var body: some View {
        VStack {
            Spacer()
            Text("Round number: \(roundNumber)")
            Text("Player's score is \(playerScore)")
                .font(.system(size: 72))
            Spacer()
            HStack {
                Spacer()
                Button(Choices.rock.rawValue) {
//                    userChoice = .rock
                }
                Spacer()
                Button(Choices.paper.rawValue) {
//                    userChoice = .paper
                }
                Spacer()
                Button(Choices.scissors.rawValue) {
//                    userChoice = .scissors
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
