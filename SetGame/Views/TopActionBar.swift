//
//  TopActionBar.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 12.03.2024.
//

import SwiftUI

struct TopActionBar: View {
    @ObservedObject var game: SetGameViewModel
    
    var body: some View {
        HStack {
            Text("Set")
                .font(.title)
                .bold()
                .padding()
            
            Spacer()
            
            newGameButton
        }
    }
    
    private var newGameButton: some View {
        Button {
            game.startNewGame()
        } label: {
            HStack {
                Image(systemName: "plus.square.on.square")
                Text("New Game")
            }
            .padding()
            .font(.title2)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    TopActionBar(game: SetGameViewModel())
}
