//
//  Shake.swift
//  WordleApp
//
//  Created by İbrahim Bayram on 30.01.2024.
//

import SwiftUI

struct Shake : GeometryEffect {
    var amount : CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)) , y: 0))
    }
}
