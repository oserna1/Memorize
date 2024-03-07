//
//  Theme.swift
//  Memorize
//
//  Created by Oscar Serna on 3/6/24.
//

import Foundation

struct Theme {
    private(set) var currentTheme: ThemeContent
    
    init() {
        currentTheme = Theme.chooseNewTheme()
        currentTheme.emojis = currentTheme.emojis.shuffled()
    }
    
    public static func chooseNewTheme() -> ThemeContent {
        return Theme.possibleThemes.randomElement().unsafelyUnwrapped
    }
    
    struct ThemeContent : Hashable {
        var color: String
        var pairOfCards: Int
        var emojis: Array<String>
        var name: String
    }
    
    private static var possibleThemes: Set<ThemeContent> = [
        ThemeContent(color: "red",pairOfCards: Int.random(in: 4..<8), emojis: Array<String>(arrayLiteral: "🅱️","🔴","🔺","🟥","💯","🉐","⛔️","❓"), name: "red" ),
        ThemeContent(color: "blue",pairOfCards: Int.random(in: 4..<8), emojis: Array<String>(arrayLiteral: "📘","📪","🩻","🧿","🛋️","💙","🌀","🏧"), name: "blue" ),
        ThemeContent(color: "green",pairOfCards: Int.random(in: 4..<8), emojis: Array<String>(arrayLiteral: "✅","💚","📗","🦠","🔫","📟","🔋","🧩"), name: "green" )
    ]
}
