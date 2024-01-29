//
//  Guess.swift
//  Wodle
//
//  Created by İbrahim Bayram on 29.01.2024.
//

import Foundation
import SwiftUI

struct Guess {
    let index : Int
    var word : String = "     "
    var bgColors = [Color](repeating: .systemBackground,count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters : [String] {
        word.map { String($0) }
    }
}
