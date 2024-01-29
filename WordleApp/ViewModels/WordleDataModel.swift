//
//  WordleDataModel.swift
//  Wodle
//
//  Created by İbrahim Bayram on 30.01.2024.
//

import SwiftUI

class WordleDataModel : ObservableObject {
    @Published var guesses : [Guess] = []
    
    var keyColors = [String: Color]()
    
    init() { newGame() }
    
    //MARK: - Setup
    func newGame() {
        populateDefaults()
    }
    
    func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWYZX"
        letters.forEach { keyColors[String($0)] = .unused }
    }
    //MARK: - Game Play
    func addToCurrentWord(_ letter: String) {
        
    }
    
    func enterWord() {
        
    }
    
    func removeLetterFromCurrentWord() {
        
    }
}
