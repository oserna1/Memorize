//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Oscar Serna on 1/30/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    init() {
        model = EmojiMemoryGame.createMemoryGame(theme: theme.currentTheme)
    }
    
    private static func createMemoryGame(theme: Theme.ThemeContent) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.pairOfCards) { pairIndex in
            if theme.emojis.indices.contains(pairIndex) {
                return theme.emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model: MemoryGame<String>
    private var theme: Theme = Theme()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards;
    }
    
    var themeName: String {
        return theme.currentTheme.name
    }
    
    // MARK: - Intent(s)
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame(theme: Theme.chooseNewTheme());
    }
}
