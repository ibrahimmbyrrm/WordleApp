//
//  SettingsView.swift
//  WordleApp
//
//  Created by İbrahim Bayram on 1.02.2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var csManager : ColorSchemeManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Text("Change Theme")
                Picker("Display Mode",selection: $csManager.colorScheme) {
                    Text("Dark").tag(ColorScheme.dark)
                    Text("Light").tag(ColorScheme.light)
                    Text("System").tag(ColorScheme.unspecified)
                }
                .pickerStyle(.segmented)
                Spacer()
            }
            .padding()
            .navigationTitle("Options")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("**X**")
                    })
                }
            }
            
        }
    }
}
#Preview {
    SettingsView()
        .environmentObject(ColorSchemeManager())
}
