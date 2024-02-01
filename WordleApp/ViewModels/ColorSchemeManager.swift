//
//  ColorSchemeManager.swift
//  WordleApp
//
//  Created by İbrahim Bayram on 1.02.2024.
//

import SwiftUI

enum ColorScheme : Int {
    case unspecified, light, dark
}

class ColorSchemeManager : ObservableObject {
    @AppStorage("colorScheme") var colorScheme : ColorScheme = .unspecified {
        didSet {
            applyColorScheme()
        }
    }
    
    func applyColorScheme() {
        UIWindow.key?.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: colorScheme.rawValue)!
    }
}
