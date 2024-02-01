//
//  WordleAppApp.swift
//  WordleApp
//
//  Created by İbrahim Bayram on 30.01.2024.
//

import SwiftUI

@main
struct WordleAppApp: App {
    @StateObject var dm = WordleDataModel()
    @StateObject var cs = ColorSchemeManager()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
                .environmentObject(cs)
                .onAppear() {
                    cs.applyColorScheme()
                }
        }
    }
}
