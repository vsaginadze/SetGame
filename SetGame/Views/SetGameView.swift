//
//  ContentView.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 04.03.2024.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game: SetGameViewModel
    
    var body: some View {
        VStack {
            TopActionBar(game: game)
            
            cards
            
            BottomActionBar(game: game)
        }
        .padding()
    }
    
    private var cards: some View {
        let aspectRatio: CGFloat = calculateAspectRatio(forNumberOfCards: game.cards.count)
        
        
        return AspectViewGrid(game.cards, aspectRatio: aspectRatio) { card in
            CardView(card: card)
                .padding(6)
                .onTapGesture {
                    withAnimation {
                        game.choose(card)
                    }
                }
        }
    }
    
    private func calculateAspectRatio(forNumberOfCards count: Int) -> Double {
        if count <= 25 { return 2/3 }
        if count > 75 { return 1/3 }
        return Double(count) * 0.03
    }
}

#Preview {
    SetGameView(game: SetGameViewModel())
}
