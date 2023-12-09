//
//  GamePlay.swift
//  MemoryTrainer
//
//  Created by Antony Razhnou on 12/9/23.
//

import Foundation

class GamePlay {
    enum Level {
        case one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fithteen, sixteen, seventeen, eighteen, nineteen, twenty
    }
    
    private let wordGenerator = WordsClass()
    private var counter = 0
    private var generatedText = [String]()
    
    private var shouldChange = true
    
    var dipshit: (() -> ())?
    
    var currentLevel: Level = .one {
        didSet {
            generateText(currentLevel)
        }
    }
    
    var userInput: String = ""
    
    func checkWord() {
        if !shouldChange { return }
        shouldChange.toggle()
        if checkCorrectness(generatedText) {
            counter += 1
        } else {
            counter = 0
        }
        
        checkCounterState()
    }
    
    func checkCounterState() {
        print(counter)
        if counter == 3 {
            counter = 0
            print("lvlup")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.goToNextLevel()
                self.shouldChange.toggle()
            })
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.generateText(self.currentLevel)
                self.shouldChange.toggle()
            })
        }
        
        print(currentLevel)
    }
    
    func goToNextLevel() {
        switch currentLevel {
        case .one:
            currentLevel = .two
        case .two:
            currentLevel = .three
        case .three:
            currentLevel = .four
        case .four:
            currentLevel = .five
        case .five:
            currentLevel = .six
        case .six:
            currentLevel = .seven
        case .seven:
            currentLevel = .eight
        case .eight:
            currentLevel = .nine
        case .nine:
            currentLevel = .ten
        case .ten:
            currentLevel = .eleven
        case .eleven:
            currentLevel = .twelve
        case .twelve:
            currentLevel = .thirteen
        case .thirteen:
            currentLevel = .fourteen
        case .fourteen:
            currentLevel = .fithteen
        case .fithteen:
            currentLevel = .sixteen
        case .sixteen:
            currentLevel = .seventeen
        case .seventeen:
            currentLevel = .eighteen
        case .eighteen:
            currentLevel = .nineteen
        case .nineteen:
            currentLevel = .twenty
        case .twenty:
            currentLevel = .one
        }
    }
    
    func getGeneratedTextAsString() -> String {
        var stringToReturn = ""
        
        for word in generatedText {
            stringToReturn += word + " "
        }
        
        return stringToReturn
    }
    
    private func checkCorrectness(_ words: [String]) -> Bool {
        switch currentLevel {
        case .one:
            return words[0].checkInvertedString(userInput)
        case .two:
            return words[0].checkInvertedString(userInput)
        case .three:
            return words[0].checkInvertedString(userInput)
        case .four:
            return words[0].checkInvertedString(userInput)
        case .five, .six, .seven, .eight:
            return checkMultipleWordsForCorrecntess(false)
        case .nine, .ten, .eleven, .twelve:
            return checkMultipleWordsForCorrecntess(true)
        case .thirteen, .fourteen, .fithteen, .sixteen:
            return checkMultipleWordsForCorrecntess(false, true)
        case .seventeen, .eighteen, .nineteen, .twenty:
            return checkMultipleWordsForCorrecntess(true, true)
        }
    }
    
    func checkMultipleWordsForCorrecntess(_ doesOrderMatter: Bool, _ wordsShouldBeInverted: Bool = false) -> Bool {
        let split = userInput.split(separator: " ")
        var stringSplit = split.map({$0.uppercased()})
        generatedText = generatedText.map({$0.uppercased()})
        if stringSplit.count == 0 { return false }
        
        if wordsShouldBeInverted {
            generatedText = generatedText.map({$0.invertTheWord()})
            
            if !doesOrderMatter {
                
                for w in stringSplit {
                    if generatedText.firstIndex(of: w) == nil || stringSplit.count != generatedText.count {
                        return false
                    }
                }
                return true
                
            } else {
                if stringSplit.count == generatedText.count {
                    for index in 0...generatedText.count - 1 {
                        if stringSplit[index] != generatedText[index] {
                            return false
                        }
                    }
                    
                    return true
                } else {
                    return false
                }
            }
            
        } else {
            if !doesOrderMatter {
                for w in stringSplit {
                    if generatedText.firstIndex(of: w) == nil || stringSplit.count != generatedText.count {
                        return false
                    }
                }
                return true
            } else {
                if stringSplit.count == generatedText.count {
                    for index in 0...generatedText.count - 1 {
                        if stringSplit[index] != generatedText[index] {
                            return false
                        }
                    }
                    return true
                    
                } else {
                    return false
                }
            }
        }
    }

    
    
    func generateText(_ level: Level) {
        switch level {
        case .one:
            generatedText = wordGenerator.getRandomWord(.fiveLetters, 1)!
        case .two:
            generatedText = wordGenerator.getRandomWord(.sixLetters, 1)!
        case .three:
            generatedText = wordGenerator.getRandomWord(.sevenLetters, 1)!
        case .four:
            generatedText = wordGenerator.getRandomWord(.eightLettes, 1)!
        case .five, .nine, .thirteen, .seventeen:
            generatedText = wordGenerator.getRandomWord(.any, 5)!
        case .six, .ten, .fourteen, .eighteen:
            generatedText = wordGenerator.getRandomWord(.any, 6)!
        case .seven, .eleven, .fithteen, .nineteen:
            generatedText = wordGenerator.getRandomWord(.any, 7)!
        case .eight, .twelve, .sixteen, .twenty:
            generatedText = wordGenerator.getRandomWord(.any, 8)!
        }
        
        dipshit?()
    }
    
    
}

extension String {
    func checkInvertedString(_ invertedInput: String) -> Bool {
        var reversedString = ""
        for letter in self.reversed() {
            reversedString += "\(letter)"
        }
        
        if invertedInput.uppercased() == reversedString.uppercased() {
            return true
        }
        
        return false
    }
    
    func invertTheWord() -> String {
        var reversedWord = ""
        for letter in self.reversed() {
            reversedWord += "\(letter)"
        }
        
        return reversedWord
    }
}
