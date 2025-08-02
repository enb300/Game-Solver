import Foundation

class WordleSolver: ObservableObject {
    @Published var correctLetters: [Int: String] = [:]
    @Published var misplacedLetters: [Int: String] = [:]
    @Published var excludedLetters: String = ""
    @Published var suggestions: [String] = []
    
    private let wordList = WordList()
    
    func setCorrectLetter(_ letter: String, at position: Int) {
        if letter.isEmpty {
            correctLetters.removeValue(forKey: position)
        } else {
            correctLetters[position] = letter.uppercased()
        }
    }
    
    func setMisplacedLetter(_ letter: String, at position: Int) {
        if letter.isEmpty {
            misplacedLetters.removeValue(forKey: position)
        } else {
            misplacedLetters[position] = letter.uppercased()
        }
    }
    
    func clearCorrectLetters() {
        correctLetters.removeAll()
    }
    
    func clearAll() {
        correctLetters.removeAll()
        misplacedLetters.removeAll()
        excludedLetters = ""
        suggestions.removeAll()
    }
    
    func findSuggestions(nytOnly: Bool = false) {
        let words = nytOnly ? wordList.nytAnswers : wordList.allWords
        
        suggestions = words.filter { word in
            return isValidWord(word.uppercased())
        }.sorted()
    }
    
    private func isValidWord(_ word: String) -> Bool {
        let wordArray = Array(word)
        
        // Check correct letters (green)
        for (position, letter) in correctLetters {
            if position < wordArray.count && String(wordArray[position]) != letter {
                return false
            }
        }
        
        // Check misplaced letters (yellow)
        for (position, letter) in misplacedLetters {
            // Letter must be in the word but not at this position
            if !word.contains(letter) {
                return false
            }
            if position < wordArray.count && String(wordArray[position]) == letter {
                return false
            }
        }
        
        // Check excluded letters (gray)
        let excludedSet = Set(excludedLetters.uppercased())
        for letter in excludedSet {
            if word.contains(String(letter)) {
                // Make sure this letter isn't in correct or misplaced
                let letterString = String(letter)
                let isInCorrect = correctLetters.values.contains(letterString)
                let isInMisplaced = misplacedLetters.values.contains(letterString)
                
                if !isInCorrect && !isInMisplaced {
                    return false
                }
            }
        }
        
        return true
    }
    
    func applyAnalysisResult(_ result: ImageAnalysisResult) {
        // Apply correct letters
        for (position, letter) in result.correctLetters {
            setCorrectLetter(letter, at: position)
        }
        
        // Apply misplaced letters
        for (position, letter) in result.misplacedLetters {
            setMisplacedLetter(letter, at: position)
        }
        
        // Apply excluded letters
        excludedLetters = result.excludedLetters.joined()
    }
}

struct ImageAnalysisResult {
    let correctLetters: [Int: String]
    let misplacedLetters: [Int: String]
    let excludedLetters: [String]
}