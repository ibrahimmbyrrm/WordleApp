//
//  ContentView.swift
//  Wodle
//
//  Created by İbrahim Bayram on 29.01.2024.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm : WordleDataModel
    @State var shouldShowSettings = false
    @State var shouldShowInformation = false
    var body: some View {
        ZStack {
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
                .disabled(dm.shouldShowStats)
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                .overlay(alignment: .top) {
                    if let toastText = dm.toastText {
                        ToastView(toastText: toastText)
                            .offset(y: 20)
                    }
                }
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack {
                            if !dm.inPlay {
                                Button(action: {
                                    dm.newGame()
                                }, label: {
                                    Text("New")
                                })
                            }
                            Button(action: {
                                shouldShowInformation.toggle()
                            }, label: {
                                Image(systemName: "questionmark.circle")
                            })
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        VStack(alignment: .center) {
                            Text("WORDLE")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundStyle(dm.hardMode ? .red : .primary)
                            if dm.hardMode {
                                Text("HARD MODE !")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.red)
                            }
                        }
                        .padding(.top,8)
                        
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Button(action: {
                                dm.shouldShowStats.toggle()
                            }, label: {
                                Image(systemName: "chart.bar")
                                Button(action: {
                                    shouldShowSettings.toggle()
                                }, label: {
                                    Image(systemName: "gearshape.fill")
                                })
                            })
                        }
                    }
                    
                })
                .sheet(isPresented: $shouldShowSettings, content: {
                    SettingsView()
                })
                .sheet(isPresented: $shouldShowInformation, content: {
                    InfoView()
                })
                
            }
            if dm.shouldShowStats {
                StatsView()
            }
        }
    }
}

#Preview {
    GameView()
        .environmentObject(WordleDataModel())
}
