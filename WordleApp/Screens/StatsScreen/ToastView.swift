//
//  ToastView.swift
//  WordleApp
//
//  Created by İbrahim Bayram on 31.01.2024.
//

import SwiftUI

struct ToastView: View {
    let toastText : String
    var body: some View {
        Text(toastText)
            .foregroundStyle(Color.systemBackground)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primary))
    }
}

#Preview {
    ToastView(toastText: "Not in a word")
}
