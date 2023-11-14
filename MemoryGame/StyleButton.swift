//
//  StyleButton.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct StyleButton: View {
    
    @ObservedObject var viewModel: MemoGameViewModel
    
    let symbol: String
    let text: String
    let action: () -> ()
    let color: Color
    
    var body: some View {
        VStack {
            Text(symbol).font(.largeTitle)
            Text(text)
        }
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    StyleButton(viewModel: MemoGameViewModel(), symbol: "paperplane.circle", text: "Tekst", action: {}, color: .blue)
}
