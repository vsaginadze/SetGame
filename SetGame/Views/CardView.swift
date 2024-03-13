//
//  CardView.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 12.03.2024.
//

import SwiftUI

struct CardView: View {
    let card: SetGameModel.Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 2)
                
                cardContent
            }
        }
    }
    
    @ViewBuilder
    private var shape: some View {
        if card.shape == "diamond" {
            Diamond()
        } else if card.shape == "oval" {
            RoundedRectangle(cornerRadius: 12)
        } else if card.shape == "rectangle" {
            Rectangle()
        }
    }
    
    private var cardContent: some View {
        VStack {
            ForEach(0..<card.numberOfItems, id: \.self) { _ in
                shape
                    .aspectRatio(2/1, contentMode: .fill)
                    .minimumScaleFactor(0.01)
            }
        }
        .padding()
    }
}

#Preview {
    CardView(card: SetGameModel.Card(id: 1, shape: "oval"))
}
