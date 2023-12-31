//
//  MemorizeApp.swift
//  Shared
//
//  Created by Oscar Serna on 1/24/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
