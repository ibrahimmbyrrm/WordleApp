//
//  UIWindow+Ext.swift
//  WordleApp
//
//  Created by İbrahim Bayram on 1.02.2024.
//

import SwiftUI

extension UIWindow {
    static var key : UIWindow? {
        guard let scene = UIApplication.shared.connectedScenes.first, let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,let window = windowSceneDelegate.window else { return nil }
        return window
    }
}
