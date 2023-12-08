//
//  WordsClass.swift
//  MemoryTrainer
//
//  Created by Antony Razhnou on 12/8/23.
//

import Foundation

class WordsClass {
    enum Words: CaseIterable {
        case fiveLetters
        case sixLetters
        case sevenLetters
        case eightLettes
    }
    
    enum Level {
        case one
        case two
        case three
        case four
    }
    
    enum WordCount {
        case five
        case six
        case seven
        case eight
    }
    
    func getAmountOfRows(wordCount: WordCount) -> Int {
        switch wordCount {
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        }
    }
    
    private var lastRandomWord: String?
    private var repeatedWords = [String]()
    
    let fiveLetterWords = ["a", "b", "c"]
    let sixLetterWords = ["Сустав"]
    let sevenLetterWords = ["Машинка"]
    let eightLetterWords = ["Аванпост"]
    
    var tempFiveLetterWords = [String]()
    var tempSixLetterWords = [String]()
    var tempSevenLetterWords = [String]()
    var tempEightLetterWords = [String]()
 
    func getRandomWord(_ level: Level,_ words: Words, _ wordCount: WordCount?) -> [String]? {
        switch level {
        case .one:
            switch words {
            case .fiveLetters:
                return [tempFiveLetterWords.getRandomWord(fiveLetterWords)]
                
            case .sixLetters:
                return [tempSixLetterWords.getRandomWord(sixLetterWords)]
                
            case .sevenLetters:
                return [tempSevenLetterWords.getRandomWord(sevenLetterWords)]
                
            case .eightLettes:
                return [tempEightLetterWords.getRandomWord(eightLetterWords)]
            }
            
        case .two, .three, .four:
            var wordArray = [String]()
            
            guard let wordCount = wordCount else { return [String]() }
            for _ in 1...getAmountOfRows(wordCount: wordCount) {
                switch Words.allCases.randomElement()! {
                case .fiveLetters:
                    wordArray.append(fiveLetterWords.randomElement()!)
                case .sixLetters:
                    wordArray.append(fiveLetterWords.randomElement()!)
                case .sevenLetters:
                    wordArray.append(fiveLetterWords.randomElement()!)
                case .eightLettes:
                    wordArray.append(fiveLetterWords.randomElement()!)
                }
            }
            
            return wordArray
        }
    }
    
    func checkForRepeatedWord(_ words: [String],_ word: String) -> Bool {
        for w in words {
            if w.capitalized == word.capitalized {
                return true
            }
        }
        
        return false
    }
}

extension Array<String> {
    mutating func getRandomWord(_ mainArr: [String]) -> String {
        if self.isEmpty {
            self = mainArr
        }
        
        guard let lastRandomWord = self.randomElement() else { return "" }
        
        self.remove(at: self.firstIndex(of: lastRandomWord)!)
        return lastRandomWord
    }
}
