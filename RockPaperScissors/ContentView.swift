//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Meitar Basson on 04/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userChoice: Choices = .rock
    @State private var gameResult: Results = .defaultRes
    
    @State private var playerScore: Double = 0
    @State private var roundNumber: Int = 1
    
    let plainText = "The result is:"
    
    enum Choices: String {
        case rock = "🪨"
        case paper = "🧻"
        case scissors = "✂️"
    }
    
    enum Results: String {
        case lose
        case tie
        case win
        case defaultRes = ""
    }
    
    let possibleChoices = [Choices.rock, Choices.paper, Choices.scissors]
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 22 / 255, green: 160 / 255, blue: 133 / 255), location: 0.3),
                .init(color: Color(red: 244 / 255, green: 208 / 255, blue: 63 / 255), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("Round number: \(roundNumber)")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
                        .padding(EdgeInsets(top: 36, leading: 10, bottom: 10, trailing: 10))
                    Text("Player's score is \(String(format: "%.1f", playerScore))")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                VStack {
                    Text("The result is \(gameResult.rawValue)")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(10)
                    HStack {
                        Spacer()
                        Button {
                            roundNumber = roundNumber + 1
                            userChoice = .rock
                            gameResult = checkForResult()
                        } label: {
                            Text(Choices.rock.rawValue)
                                .font(.system(size: 36))
                        }
                        Spacer()
                        Button {
                            roundNumber = roundNumber + 1
                            userChoice = .paper
                            gameResult = checkForResult()
                        } label: {
                            Text(Choices.paper.rawValue)
                                .font(.system(size: 36))
                        }
                        
                        Spacer()
                        Button {
                            roundNumber = roundNumber + 1
                            userChoice = .scissors
                            gameResult = checkForResult()
                        } label: {
                            Text(Choices.scissors.rawValue)
                                .font(.system(size: 36))
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
    
    func checkForResult() -> Results {
        let computerChoice = getComputerChoice()
        
        switch userChoice {
        case .rock:
            switch computerChoice {
            case .rock:
                playerScore = playerScore + 0.5
                return .tie
            case .paper:
                return .lose
            case .scissors:
                playerScore = playerScore + 1
                return .win
            }
        case .paper:
            switch computerChoice {
            case .rock:
                playerScore = playerScore + 1
                return .win
            case .paper:
                playerScore = playerScore + 0.5
                return .tie
            case .scissors:
                return .lose
            }
        case .scissors:
            switch computerChoice {
            case .rock:
                return .lose
            case .paper:
                playerScore = playerScore + 1
                return .win
            case .scissors:
                playerScore = playerScore + 0.5
                return .tie
            }
        }
    }
    
    
    
    func getComputerChoice() -> Choices {
        let computerChoice = Int.random(in: 0...2)
        switch computerChoice {
        case 0:
            return .rock
        case 1:
            return .paper
        default:
            return .scissors
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
