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
        let aspectRatio: CGFloat = 2/3
        
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
    
    private func calculateAspectRatio(with count: Int) -> CGFloat {
        if count < 25 { return 2/3 }
        if count > 25 && count < 40 { return 3 }
        return 3
    }
}

#Preview {
    SetGameView(game: SetGameViewModel())
}
