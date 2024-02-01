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
    var bgColors = [Color](repeating: .wrong,count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters : [String] {
        word.map { String($0) }
    }
    
    var results : String {
        let tryColors : [Color : String] = [.correct : "🟩",.misplaced : "🟨",.wrong: "⬛️"]
        return bgColors.compactMap({ tryColors[$0] }).joined(separator: "")
    }
}
