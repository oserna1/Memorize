//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Oscar Serna on 1/30/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["😀","🥰","🥶","😱","🤯","😜","🥸","😡","🥳","😭","🤢"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numverOfPairsOfCards: 4) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards;
    }
    
    // MARK: - Intent(s)
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
