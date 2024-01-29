//
//  WodleApp.swift
//  Wodle
//
//  Created by İbrahim Bayram on 29.01.2024.
//

import SwiftUI

@main
struct WodleApp: App {
    @StateObject var dm = WordleDataModel()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
