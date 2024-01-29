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
                    GuessView(guess: $dm.guesses[0])
                    GuessView(guess: $dm.guesses[1])
                    GuessView(guess: $dm.guesses[2])
                    GuessView(guess: $dm.guesses[3])
                    GuessView(guess: $dm.guesses[4])
                    GuessView(guess: $dm.guesses[5])
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
