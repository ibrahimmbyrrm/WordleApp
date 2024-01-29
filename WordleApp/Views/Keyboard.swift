//
//  Keyboard.swift
//  Wodle
//
//  Created by İbrahim Bayram on 30.01.2024.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var dm : WordleDataModel
    var topRowArray = "QWERTYUIOP".map { String($0) }
    var secondRowArray = "ASDFGHJKL".map { String($0) }
    var thirdRowArray = "ZXCVBNM".map { String($0) }
    var body: some View {
        VStack {
            HStack(spacing: 2) {
                ForEach(topRowArray,id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
            }
            HStack(spacing: 2) {
                ForEach(secondRowArray,id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
            }
            HStack(spacing: 2) {
                Button {
                    dm.enterWord()
                } label: {
                    Text("Enter")
                }
                .font(.system(size: 20))
                .frame(width: 60,height: 50)
                .foregroundStyle(.primary)
                .background(.unused)
                ForEach(thirdRowArray,id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                Button {
                    dm.removeLetterFromCurrentWord()
                } label: {
                    Image(systemName: "delete.backward.fill")
                        .font(.system(size: 20,weight: .heavy))
                        .frame(width: 40,height: 50)
                        .foregroundStyle(.primary)
                        .background(.unused)
                }
            }
        }
    }
}

#Preview {
    Keyboard()
        .environmentObject(WordleDataModel())
        .scaleEffect(Global.keyboardScale)
}