//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation
import SwiftUI

class MemoGameViewModel: ObservableObject {
    private static let blueEmojiIcons: Array<String> = ["😀","😅","😂","😍","😎","😡","😨","🤡"]
    private static let redEmojiIcons: Array<String> = ["🐶","🐱","🦊","🐻","🦁","🐔","🐸","🐵"]
    private static let greenEmojiIcons: Array<String> = ["🩷","❤️","🧡","💚","💙","💜","🤍","❤️‍🔥"]
    
    private static let emojis = [blueEmojiIcons, redEmojiIcons, greenEmojiIcons]
    
    @Published var model = MemoGameViewModel.createMemoGame()
    @Published var cardColorTheme = Color.blue
    
    static func createMemoGame() -> MemoGameModel<String> {
        return MemoGameModel<String>(
            numberOfPairsOfCards: 8
        ) { index in
            if emojis[0].indices.contains(index) {
                return emojis[0][index]
            }
            else {
                return "??"
            }
        }
    }
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    func shuffle() {
        model.reset()
        model.shuffle()
    }
    
    func setTheme(numberOfPairsOfCards: Int, themeId: Int) {
        model.setTheme(numberOfPairsOfCards: numberOfPairsOfCards, cardContentFactory: { index in
            if MemoGameViewModel.emojis[themeId].indices.contains(index) {
                return MemoGameViewModel.emojis[themeId][index]
            }
            else {
                return "??"
            }
        })
    }
    
    func selectCard(card: MemoGameModel<String>.Card){
        model.selectCard(card: card)
    }
}
