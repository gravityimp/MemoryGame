//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent : Equatable {
    
    private(set) var cards: Array<Card>
    
    public var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var openCards: Array<Int> = cards.indices.filter{ index in cards[index].isFlipped }
            return openCards.count == 1 ? openCards.first : nil
        }
        
        set {
            return cards.indices.forEach {
                cards[$0].isFlipped = (newValue == $0)
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent) {
        
        self.cards = []
        
        reset(numberOfPairsOfCards: numberOfPairsOfCards, cardContentFactory: cardContentFactory)
        
        shuffle()
    }
    
    mutating func shuffle() {
        self.cards.shuffle()	
    }
    
    mutating func reset() {
        for i in 0..<self.cards.count {
            self.cards[i].isFlipped = false
            self.cards[i].isMatching = false
        }
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
        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            if (!cards[index].isFlipped && !cards[index].isMatching) {
                if let matchIndex = indexOfOneAndOnlyFaceUpCard {
                    if (cards[index].content == cards[matchIndex].content) {
                        cards[index].isMatching = true
                        cards[matchIndex].isMatching = true
                    }
                } else {
                    indexOfOneAndOnlyFaceUpCard = index
                }
                cards[index].isFlipped = true
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
