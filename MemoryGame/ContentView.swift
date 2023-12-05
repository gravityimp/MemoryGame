//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MemoGameViewModel
    
    var styles: some View {
        return HStack {
            StyleButton(viewModel: viewModel, symbol: "😂", text: "Blue", action: {
                viewModel.setTheme(numberOfPairsOfCards: 8, themeId: 0)
                viewModel.cardColorTheme = .blue
            }, color: .blue).foregroundColor(viewModel.cardColorTheme)
            Spacer()
            StyleButton(viewModel: viewModel, symbol: "🐔", text: "Green", action: {
                viewModel.setTheme(numberOfPairsOfCards: 6, themeId: 1)
                viewModel.cardColorTheme = .green
            }, color: .red).foregroundColor(viewModel.cardColorTheme)
            Spacer()
            StyleButton(viewModel: viewModel, symbol: "❤️‍🔥", text: "Red", action: {
                viewModel.setTheme(numberOfPairsOfCards: 4, themeId: 2)
                viewModel.cardColorTheme = .red
            }, color: .green).foregroundColor(viewModel.cardColorTheme)
        }
    }
    
    var shuffleButton: some View {
        Button("SHUFFLE") {
            viewModel.shuffle()
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit).foregroundColor(viewModel.cardColorTheme)
                    .padding(4)
                    .onTapGesture {
                        viewModel.selectCard(card: card)
                    }
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle).foregroundColor(viewModel.cardColorTheme)
            Text("Score: \(viewModel.score)")
            ScrollView {
                cards.animation(.default, value: viewModel.cards)
            }
            Spacer()
            shuffleButton.padding(.bottom).foregroundColor(viewModel.cardColorTheme)
            styles
//            numCardsAdjuster
//            themeAdjuster
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
