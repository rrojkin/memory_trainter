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
        case any
    }
        
    let fiveLetterWords = ["домой", "ночьи", "книга", "мышка", "солью",
                           "лампа", "рекаи", "крыша", "косой", "мочаа",
                           "жить", "мытьь", "волна", "крыло", "мышьь"]
    
    let sixLetterWords = ["кофеин", "рекаи", "морож", "краска", "песняа",
                          "домико", "цветок", "ночкаа", "мышкаа", "снегок",
                          "горкаа", "крышка", "домаш", "мышкаи", "крышаа"]
    
    let sevenLetterWords = ["каранда", "слонико", "бревноо", "блинчи", "ребренк",
                            "виногра", "грибоки", "космосы", "крепост", "цепочк",
                            "рыбаков", "ложками", "человек", "пальтоо", "котлето"]
    
    let eightLetterWords = ["журналы", "случайно", "зонтиком", "домашний", "отражен",
                            "деревце", "смешноо", "закатом", "шарфики", "бродяга",
                            "пляжный", "печенье", "берегом", "лужайка", "заборчи"]
    
    var tempFiveLetterWords = [String]()
    var tempSixLetterWords = [String]()
    var tempSevenLetterWords = [String]()
    var tempEightLetterWords = [String]()
    
    func getRandomWord(_ words: Words, _ wordCount: Int) -> [String]? {
        var wordArray = [String]()
        
        switch words {
        case .fiveLetters:
            for _ in 1...wordCount {
                wordArray.append(tempFiveLetterWords.getRandomWord(fiveLetterWords))
            }
        case .sixLetters:
            for _ in 1...wordCount {
                wordArray.append(tempSixLetterWords.getRandomWord(sixLetterWords))
            }
        case .sevenLetters:
            for _ in 1...wordCount {
                wordArray.append(tempSevenLetterWords.getRandomWord(sevenLetterWords))
            }
        case .eightLettes:
            for _ in 1...wordCount {
                wordArray.append(tempEightLetterWords.getRandomWord(eightLetterWords))
            }
            
        case .any:
            for _ in 1...wordCount {
                var elem = Int.random(in: 1...4)
                switch elem {
                case 1:
                    wordArray.append(tempFiveLetterWords.getRandomWord(fiveLetterWords))
                case 2:
                    wordArray.append(tempSixLetterWords.getRandomWord(sixLetterWords))
                case 3:
                    wordArray.append(tempSevenLetterWords.getRandomWord(sevenLetterWords))
                case 4:
                    wordArray.append(tempEightLetterWords.getRandomWord(eightLetterWords))
                default:
                    print("default")
                }
            }
        }
        return wordArray
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
