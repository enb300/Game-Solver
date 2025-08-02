//
//  WordleSolver.swift
//  Game Solver
//
//  Created by Emma Brown on 8/2/25.
//

import Foundation
import SwiftUI

class WordleSolver: ObservableObject {
    @Published var correctLetters: [String] = Array(repeating: "", count: 5)
    @Published var misplacedLetters: [String] = Array(repeating: "", count: 5)
    @Published var excludedLetters: String = ""
    @Published var suggestedWords: [String] = []
    
    private let wordList = WordList()
    
    func searchWords() {
        let filteredWords = wordList.words.filter { word in
            return isValidWord(word)
        }
        
        DispatchQueue.main.async {
            self.suggestedWords = Array(filteredWords.prefix(50)) // Limit to first 50 results
        }
    }
    
    private func isValidWord(_ word: String) -> Bool {
        let word = word.uppercased()
        
        // Check correct letters
        for (index, letter) in correctLetters.enumerated() {
            if !letter.isEmpty && word[word.index(word.startIndex, offsetBy: index)] != Character(letter) {
                return false
            }
        }
        
        // Check excluded letters
        for letter in excludedLetters {
            if word.contains(letter) {
                return false
            }
        }
        
        // Check misplaced letters
        for (index, letter) in misplacedLetters.enumerated() {
            if !letter.isEmpty {
                // Letter must be in the word but not at this position
                if !word.contains(letter) || word[word.index(word.startIndex, offsetBy: index)] == Character(letter) {
                    return false
                }
            }
        }
        
        return true
    }
    
    func clearCorrectLetters() {
        correctLetters = Array(repeating: "", count: 5)
    }
    
    func clearMisplacedLetters() {
        misplacedLetters = Array(repeating: "", count: 5)
    }
    
    func clearExcludedLetters() {
        excludedLetters = ""
    }
    
    func clearAll() {
        clearCorrectLetters()
        clearMisplacedLetters()
        clearExcludedLetters()
        suggestedWords = []
    }
    
    func updateFromScreenshot(_ gameState: WordleGameState) {
        DispatchQueue.main.async {
            self.correctLetters = gameState.correctLetters
            self.misplacedLetters = gameState.misplacedLetters
            self.excludedLetters = gameState.excludedLetters
        }
    }
}

struct WordleGameState {
    let correctLetters: [String]
    let misplacedLetters: [String]
    let excludedLetters: String
} 