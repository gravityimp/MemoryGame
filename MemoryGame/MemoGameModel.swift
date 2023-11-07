//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> {
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->String) {
        
        var cards: [Card] = []
        
        for i in 0..<numberOfPairsOfCards*2 {
            cards.append(Card(content: cardContentFactory(i)))
            cards.append(Card(content: cardContentFactory(i)))
        }
    }
    
    func selectCard(card: Card) {
            
    }
    
    struct Card {
        var isFlipped = false
        var isMatching = false
        var content = ""
        
        init(content: String) {
            self.content = content
        }
    }
}
