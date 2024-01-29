//
//  LetterButtonView.swift
//  Wodle
//
//  Created by İbrahim Bayram on 30.01.2024.
//

import SwiftUI

struct LetterButtonView: View {
    @EnvironmentObject var dm : WordleDataModel
    var letter : String
    var body: some View {
        Button(action: {
            dm.addToCurrentWord(letter)
        }, label: {
            Text(letter)
                .font(.system(size: 20))
                .frame(width: 35,height: 50)
                .background(dm.keyColors[letter])
                .foregroundStyle(.primary)
        })
        .buttonStyle(.plain)
    }
}

#Preview {
    LetterButtonView(letter: "L")
        .environmentObject(WordleDataModel())
}
