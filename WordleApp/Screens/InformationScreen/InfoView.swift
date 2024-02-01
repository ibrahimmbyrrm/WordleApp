//
//  InfoView.swift
//  WordleApp
//
//  Created by İbrahim Bayram on 2.02.2024.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack(alignment : .leading) {
                Text(
            """
**WORDLE**'i 6 denemede bulun.

Her tahmin 5 harfli doğru bir kelime olmalıdır. Göndermek için enter'a basın.

Her tahminden sonra kutucukların renkleri tahmininizin yakınlığına göre değişecektir.

"""
            
                )
                Divider()
                Text("**ÖRNEKLER**")
                Image("Abone")
                    .resizable()
                    .scaledToFit()
                Text("A harfi kelimede var ve doğru yerde.")
                Image("Gizem")
                    .resizable()
                    .scaledToFit()
                Text("İ harfi kelimede var fakat yanlış yerde")
                Image("Falez")
                    .resizable()
                    .scaledToFit()
                Text("Z harfi kelimede yok.")
                Divider()
                Text("**Yeni WORDLE için 'New' butonuna basın.**")
                Spacer()
            }
            .frame(width: min(Global.screenWidth - 30, 320))
            .navigationTitle("HOW TO PLAY")
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
    InfoView()
}
