//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis: [String] = ["😀", "😍", "🥱", "😱", "😂", "😡", "👻", "🤡"]
    @State var cards: [String] = ["😀", "😀", "😍", "😍"]
    
    @State var cardColorTheme = Color.blue
    
    
    var styles: some View {
        return HStack {
            StyleButton(icon: .constant("😀"), number: .constant(1), color: .constant(Color.blue), theme: $cardColorTheme)
            Spacer()
            StyleButton(icon: .constant("😱"), number: .constant(2), color: .constant(Color.green), theme: $cardColorTheme)
            Spacer()
            StyleButton(icon: .constant("😡"), number: .constant(3), color: .constant(Color.red), theme: $cardColorTheme)
        }
    }
    
    
    
    var body: some View {
        
            VStack() {
                Text("Memo").font(.title)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                        ForEach(0..<(cards.isEmpty ? 0 : cards.count), id: \.self) {
                            CardView(value:.constant(cards[$0]), theme: $cardColorTheme)
                        }
                    }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                styles
                HStack {
                    Button(action: handleAddCard) {
                        Text("+").font(.title).frame(minWidth: 50)
                    }.border(.blue, width: 2.0).disabled(cards.count == emojis.count)
                    Spacer()
                    Button(action: handleRemoveCard) {
                        Text("-").font(.title).frame(minWidth: 50)
                    }.border(.blue, width: 2.0).disabled(cards.count == 2)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()

    }
    
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        var card = CardView(value:.constant(symbol), theme: $cardColorTheme)
        cards.insert(symbol, at: offset)
        return card
    }
    
    func handleAddCard() {
        let choice: [String] = emojis.filter { !cards.contains($0) }
        if (choice.isEmpty) {
            return
        }
        
        var newSymbol: String = choice.randomElement()!
        var c1 = adjustCardNumber(by: cards.count, symbol: newSymbol)
        var c2 = adjustCardNumber(by: cards.count, symbol: newSymbol)
    }
    
    func handleRemoveCard() {
        let symbol = cards.last
        if (cards.isEmpty) {
            return
        }

        for i in stride(from: cards.count - 1, to: 0, by: -1) {
            if cards[i] == symbol {
                cards.remove(at: i)
            }
        }
    }
}

#Preview {
    ContentView()
}
