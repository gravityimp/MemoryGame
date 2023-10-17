//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis: [String] = ["😀", "😍", "🥱", "😱", "😂", "😡", "👻"]
    @State var cards: [String] = ["😀", "😍"]
    
    var body: some View {
        
            VStack() {
                Text("Memo").font(.title)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
                        ForEach(0..<(cards.isEmpty ? 0 : cards.count), id: \.self) {
                            CardView(value:.constant(cards[$0]))
                        }
                    }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                HStack {
                    StyleButton(icon: .constant("😀"), number: .constant(1))
                    Spacer()
                    StyleButton(icon: .constant("😱"), number: .constant(2))
                    Spacer()
                    StyleButton(icon: .constant("😡"), number: .constant(3))
                }
//                HStack {
//                    Button(action: handleAddCard) {
//                        Text("+").font(.title).frame(minWidth: 50)
//                    }.border(.blue, width: 2.0).disabled(cards.count == emojis.count)
//                    Spacer()
//                    Button(action: handleRemoveCard) {
//                        Text("-").font(.title).frame(minWidth: 50)
//                    }.border(.blue, width: 2.0).disabled(cards.count == 2)
//                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()

    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        var card = CardView(value:.constant(symbol))
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
    }
    
    func handleRemoveCard() {
        if (cards.isEmpty) {
            return
        }

        cards.remove(at: cards.count - 1)
    }
}

#Preview {
    ContentView()
}
