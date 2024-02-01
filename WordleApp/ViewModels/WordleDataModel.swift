//
//  WordleDataModel.swift
//  Wodle
//
//  Created by İbrahim Bayram on 30.01.2024.
//

import SwiftUI

class WordleDataModel : ObservableObject {
    @Published var guesses : [Guess] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    @Published var toastText : String?
    @Published var shouldShowStats = false
    @AppStorage("hardMode") var hardMode : Bool = false
    
    var keyColors = [String: Color]()
    var matchedLetters = [String]()
    var misplacedLetters = [String]()
    var correctlyPlacedLetters = [String]()
    var selectedWord = ""
    var currentWord = ""
    var currentStat : Statistic
    var tryIndex = 0
    var inPlay = false
    var gameOver = false
    var toastWords = ["Genius", "Magnificent", "Impressive", "Splendid", "Great", "Phew"]
    var gameStarted : Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    var disabledKeys : Bool {
        !inPlay || currentWord.count == 5
    }
    
    init() {
        currentStat = Statistic.loadStats()
        newGame()
    }
    
    //MARK: - Setup
    func newGame() {
        populateDefaults()
        selectedWord = Global.commonWords.randomElement()!
        currentWord = ""
        inPlay = true
        tryIndex = 0
        gameOver = false
        correctlyPlacedLetters = [String](repeating: "-", count: 5)
        misplacedLetters = []
        matchedLetters = []
        print(selectedWord)
    }
    
    func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        let letters = "ABCÇDEFGĞHIİJKLMNOÖPQRSŞTUÜVWYZX"
        letters.forEach { keyColors[String($0)] = .unused }
    }
    //MARK: - Game Play
    func addToCurrentWord(_ letter: String) {
        currentWord += letter
        updateRow()
    }
    
    func hardCorrectCheck() -> String? {
        let guessLetters = guesses[tryIndex].guessLetters
        for i in 0...4 {
            if correctlyPlacedLetters[i] != "-" {
                if guessLetters[i] != correctlyPlacedLetters[i] {
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .ordinal
                    return "\(formatter.string(for: i + 1)!) letter must be \(correctlyPlacedLetters[i])"
                }
            }
        }
        return nil
    }
    
    func hardMisplacedCheck() -> String? {
        let guessLetter = guesses[tryIndex].guessLetters
        for letter in misplacedLetters {
            if !guessLetter.contains(letter) {
                return "Must contain the letter '\(letter)' ."
            }
        }
        return nil
    }
    
    func enterWord() {
        if currentWord == selectedWord {
            gameOver = true
            print("You win")
            currentStat.update(win: true, index: tryIndex)
            setCurrentGuessColors()
            showToast(with: toastWords[tryIndex])
            inPlay = false
        }else {
            if verifyWord() {
                if hardMode {
                    if let toastString = hardCorrectCheck() {
                        showToast(with: toastString)
                        return
                    }
                    if let toastString = hardMisplacedCheck() {
                        showToast(with: toastString)
                        return
                    }
                }
                setCurrentGuessColors()
                currentWord = ""
                tryIndex += 1
                if tryIndex == 6 {
                    currentStat.update(win: false)
                    gameOver = true
                    inPlay = false
                    showToast(with: selectedWord)
                    print("You Lose")
                }
            }else {
                withAnimation {
                    self.incorrectAttempts[tryIndex] += 1
                }
                showToast(with: "Not in word list.")
                incorrectAttempts[tryIndex] = 0
            }
        }
        
    }
    
    func removeLetterFromCurrentWord() {
        currentWord.removeLast()
        updateRow()
    }
    
    func updateRow() {
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
    
    func setCurrentGuessColors() {
        let correctLetters = selectedWord.map { String($0) }
        var frequency = [String : Int]()
        for letter in correctLetters {
            frequency[letter , default: 0] += 1
        }
        for i in 0...4 {
            let correctLetter = correctLetters[i]
            let guessLetter = guesses[tryIndex].guessLetters[i]
            if guessLetter == correctLetter {
                guesses[tryIndex].bgColors[i] = .correct
                if !matchedLetters.contains(guessLetter) {
                    matchedLetters.append(guessLetter)
                    keyColors[guessLetter] = .correct
                }
                if misplacedLetters.contains(guessLetter) {
                    if let index = misplacedLetters.firstIndex(where: {$0 == guessLetter}) {
                        misplacedLetters.remove(at: index)
                    }
                }
                correctlyPlacedLetters[i] = correctLetter
                frequency[correctLetter]! -= 1
            }
        }
        
        for i in 0...4 {
            let guessLetter = guesses[tryIndex].guessLetters[i]
            if correctLetters.contains(guessLetter) && guesses[tryIndex].bgColors[i] != .correct && frequency[guessLetter]! > 0 {
                guesses[tryIndex].bgColors[i] = .misplaced
                if !misplacedLetters.contains(guessLetter) {
                    misplacedLetters.append(guessLetter)
                    keyColors[guessLetter] = .misplaced
                }
                frequency[guessLetter]! -= 1
            }
        }
        
        for i in 0...4 {
            let guessLetter = guesses[tryIndex].guessLetters[i]
            if keyColors[guessLetter] != .correct && keyColors[guessLetter] != .misplaced {
                keyColors[guessLetter] = .wrong
            }
        }
        flipCards(for: tryIndex)
    }
    
    func flipCards(for row : Int) {
        for col in 0...4 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(col) * 0.2) {
                self.guesses[row].cardFlipped[col].toggle()
            }
        }
    }
    
    func showToast(with text : String?) {
        withAnimation {
            toastText = text
        }
        
        withAnimation(Animation.linear(duration: 0.2).delay(3)) {
            toastText = nil
            if gameOver {
                withAnimation(Animation.linear(duration: 0.2).delay(3)) {
                    shouldShowStats.toggle()
                }
            }
        }
    }
    
    func shareResult() {
        let stat = Statistic.loadStats()
        let resultString = """
Wordle \(stat.games) \(tryIndex < 6 ? "\(tryIndex + 1)/6" : "")
\(guesses.compactMap({$0.results}).joined(separator: "\n"))
"""
        let activityController = UIActivityViewController(activityItems: [resultString], applicationActivities: nil)
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            UIWindow.key?.rootViewController?.present(activityController, animated: true)
        case .pad:
            activityController.popoverPresentationController?.sourceView = UIWindow.key
            activityController.popoverPresentationController?.sourceRect = CGRect(x: Global.screenWidth / 2,
                                                                                  y: Global.screenHeight / 2,
                                                                                  width: 200,
                                                                                  height: 200)
            UIWindow.key?.rootViewController?.present(activityController, animated: true)
        default:
            break
        }
    }
}
