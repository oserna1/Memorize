//
//  ContentView.swift
//  Shared
//
//  Created by Oscar Serna on 1/24/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                cards.animation(.default, value: viewModel.cards)
            }
            HStack {
                Button("Shuffle") {
                    viewModel.shuffle()
                }
                Button("New Game") {
                    viewModel.newGame()
                }
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum:widthThatBestFits(cardCount: viewModel.cards.count)), spacing: 0)]) {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        return cardCount > 8 ? (840 / CGFloat(cardCount)) : cardCount > 5 ? (670 / CGFloat(cardCount)) : (500 / CGFloat(cardCount))
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                if card.isFaceUp {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(contentMode: .fit)
                } else if card.isMatched {
                    base.opacity(0)
                } else {
                    base.fill()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
