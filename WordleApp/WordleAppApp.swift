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
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
