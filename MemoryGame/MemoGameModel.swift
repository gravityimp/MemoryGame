//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent : Equatable {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent) {
        
        self.cards = []
        
        reset(numberOfPairsOfCards: numberOfPairsOfCards, cardContentFactory: cardContentFactory)
    }
    
    mutating func shuffle() {
        self.cards.shuffle()
    }
    
    mutating func reset(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent) {
        self.cards = []
        
        for i in 0..<max(2, numberOfPairsOfCards) {
            self.cards.append(Card(id: "\(i)_a", content: cardContentFactory(i)))
            self.cards.append(Card(id: "\(i)_b", content: cardContentFactory(i)))
        }
    }
    
    mutating func setTheme(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent) {
        reset(numberOfPairsOfCards: numberOfPairsOfCards, cardContentFactory: cardContentFactory)
        shuffle()
    }
    
    mutating func selectCard(card: Card) {
        for i in cards.indices {
            if (cards[i].id == card.id) {
                self.cards[i].isFlipped.toggle()
                break;
            }
        }
    }
    	
    struct Card : Equatable, Identifiable {
        var id: String
        var isFlipped: Bool = false
        var isMatching: Bool = false
        var content: CardContent
    }
}
