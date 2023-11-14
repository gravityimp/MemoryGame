//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct CardView: View {
    
    var card: MemoGameModel<String>.Card
    
    init(_ card: MemoGameModel<String>.Card){
        self.card = card
    }
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content).font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }.opacity(card.isFlipped ? 1 : 0)
            base.fill().opacity(card.isFlipped ? 0 : 1)
        }
    }
}

//RoundedRectangle(cornerRadius: 12.0).stroke(.blue, lineWidth: 2).background(isOpen ? nil : RoundedRectangle(cornerRadius: 12.0).fill(.blue)).aspectRatio(CGSize(width: 2, height: 3), contentMode: .fill)
//Text(isOpen ? value : "").font(.largeTitle)

//#Preview {
//    CardView(value: .constant(""), theme: .constant(Color.blue))
//}
