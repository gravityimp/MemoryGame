//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        @State var cards: [CardView] = []
        
        VStack() {
            Spacer()
            HStack {
                Button(action: {}) {
                    Text("+").font(.title).frame(minWidth: 50)
                }.border(.blue, width: 2.0)
                Spacer()
                Button(action: {}) {
                    Text("-").font(.title).frame(minWidth: 50)
                }.border(.blue, width: 2.0)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        return CardView("")
    }
}

#Preview {
    ContentView()
}
