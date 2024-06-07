//
//  GameViewModel.swift
//  Challenge_MultiplicationApp
//
//  Created by Vounatsou, Maria on 5/6/24.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var textDisplay = ""
    @Published var numberOfTables: Int
    @Published var rounds: [Int]
    @Published var userAnswer = ""
    @Published var randomNumber = 0
    @Published var randomUser = 0
    @Published var score = 0
    @Published var negativeScore = 0
    @Published var alertBool = false
    @Published var roundsCount = 0
    @Published var selectedRounds = 2
    
    init(numberOfTables: Int, rounds: [Int]) {
        self.numberOfTables = 2
        self.rounds = [2, 5, 10, 20]
    }

    func generateNewQuestion() {
        self.randomNumber = Int.random(in: 2...12)
        self.randomUser = Int.random(in: 2...self.numberOfTables)
    }
    
    func submitAnswer() {
        
        if let result = Int(self.userAnswer.trimmingCharacters(in: .whitespaces)), result == self.randomNumber * self.randomUser {
            self.textDisplay = "Hooray!"
            self.score += 1
        } else {
            self.textDisplay = "Boooo!"
            self.negativeScore += 1
        }
        self.roundsCount += 1
        self.userAnswer = ""
        
        if self.roundsCount == self.selectedRounds{
            self.alertBool = true
        } else {
            self.generateNewQuestion()
        }
    }
    
    func terminal() {
        self.score = 0
        self.negativeScore = 0
        self.userAnswer = ""
        self.numberOfTables = 2
        self.roundsCount = 0
        self.textDisplay = ""
        self.alertBool = false
        generateNewQuestion()
    }
}
