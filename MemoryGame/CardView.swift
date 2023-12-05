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
            CirclePart(angleEnd: Angle(degrees: 110)).overlay(content: {
                Text(card.content).font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                        .rotationEffect(Angle(degrees: card.isMatching ? 360 : 0))
                        .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
            })
            .transformIntoCard(isFlipped: card.isFlipped).opacity(card.isMatching ? 0 : 1)
    }
}

//RoundedRectangle(cornerRadius: 12.0).stroke(.blue, lineWidth: 2).background(isOpen ? nil : RoundedRectangle(cornerRadius: 12.0).fill(.blue)).aspectRatio(CGSize(width: 2, height: 3), contentMode: .fill)
//Text(isOpen ? value : "").font(.largeTitle)

//#Preview {
//    CardView(value: .constant(""), theme: .constant(Color.blue))
//}
