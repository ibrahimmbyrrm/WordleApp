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
    
    var keyColors = [String: Color]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    var gameStarted : Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    var disabledKeys : Bool {
        !inPlay || currentWord.count == 5
    }
    
    init() { newGame() }
    
    //MARK: - Setup
    func newGame() {
        populateDefaults()
        selectedWord = Global.commonWords.randomElement()!
        currentWord = ""
        inPlay = true
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
    
    func enterWord() {
        if verifyWord() {
            print("Valid Word")
        }else {
            withAnimation {
                self.incorrectAttempts[tryIndex] += 1
            }
            incorrectAttempts[tryIndex] = 0
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
}
