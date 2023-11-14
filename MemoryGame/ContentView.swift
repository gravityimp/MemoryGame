//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    
//    @State var emojis: [String] = ["😀", "😍", "🥱", "😱", "😂", "😡", "👻", "🤡"]
//    @State var cards: [String] = ["😀", "😀", "😍", "😍"]
    
//    @State var cardColorTheme = Color.blue
    
    @ObservedObject var viewModel: MemoGameViewModel
    
    var styles: some View {
        return HStack {
            StyleButton(viewModel: viewModel, symbol: "😂", text: "Blue", action: {
                viewModel.setTheme(numberOfPairsOfCards: 8, themeId: 0)
                viewModel.shuffle()
                viewModel.cardColorTheme = .blue
            }, color: .blue).foregroundColor(viewModel.cardColorTheme)
            Spacer()
            StyleButton(viewModel: viewModel, symbol: "🐔", text: "Green", action: {
                viewModel.setTheme(numberOfPairsOfCards: 8, themeId: 1)
                viewModel.shuffle()
                viewModel.cardColorTheme = .green
            }, color: .red).foregroundColor(viewModel.cardColorTheme)
            Spacer()
            StyleButton(viewModel: viewModel, symbol: "❤️‍🔥", text: "Red", action: {
                viewModel.setTheme(numberOfPairsOfCards: 8, themeId: 2)
                viewModel.shuffle()
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
    
    
//    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
//        var card = CardView(value:.constant(symbol), theme: $cardColorTheme)
//        cards.insert(symbol, at: offset)
//        return card
//    }
    
//    func handleAddCard() {
//        let choice: [String] = emojis.filter { !cards.contains($0) }
//        if (choice.isEmpty) {
//            return
//        }
//        
//        var newSymbol: String = choice.randomElement()!
//        var c1 = adjustCardNumber(by: cards.count, symbol: newSymbol)
//        var c2 = adjustCardNumber(by: cards.count, symbol: newSymbol)
//    }
//    
//    func handleRemoveCard() {
//        let symbol = cards.last
//        if (cards.isEmpty) {
//            return
//        }
//
//        for i in stride(from: cards.count - 1, to: 0, by: -1) {
//            if cards[i] == symbol {
//                cards.remove(at: i)
//            }
//        }
//    }
}

#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
