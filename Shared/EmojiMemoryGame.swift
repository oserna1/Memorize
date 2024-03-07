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
    
    var color: Color {
        if let color = colors[theme.currentTheme.color] {
            return color
        } else {
            return Color.blue
        }
    }
    
    private let colors = [
        "red": Color.red,
        "blue": Color.blue,
        "green": Color.green
    ]
    
    // MARK: - Intent(s)
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func chooseNewTheme() -> Theme.ThemeContent{
        theme = Theme()
        return theme.currentTheme
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame(theme: chooseNewTheme());
    }
}
