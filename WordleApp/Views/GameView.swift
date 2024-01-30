//
//  ContentView.swift
//  Wodle
//
//  Created by İbrahim Bayram on 29.01.2024.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm : WordleDataModel
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack(spacing: 3) {
                    ForEach(0...5,id: \.self) { index in
                        GuessView(guess: $dm.guesses[index])
                            .modifier(Shake(animatableData: CGFloat(dm.incorrectAttempts[index])))
                    }
                }
                .frame(width: Global.boardWidth,height: 6 * Global.boardWidth / 5)
                Spacer()
                Keyboard()
                    .scaleEffect(Global.keyboardScale)
                    .padding(.top)
                Spacer()
            }
            
            
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {}, label: {
                            Image(systemName: "questionmark.circle")
                        })
                    }
                    ToolbarItem(placement: .principal) {
                        Text("WORDLE")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(.primary)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "chart.bar")
                                Button(action: {}, label: {
                                    Image(systemName: "gearshape.fill")
                                })
                            })
                        }
                    }
                    
                })
            
        }
    }
}

#Preview {
    GameView()
        .environmentObject(WordleDataModel())
}
