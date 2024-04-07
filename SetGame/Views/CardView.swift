//
//  CardView.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 12.03.2024.
//

import SwiftUI

struct CardView: View {
    typealias Card = SetGameModel.Card
    let card: Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            let selectedCardColor = Color(red: 1.0, green: 0.8, blue: 0.6)
            
            Group {
                base.fill(.white)
                
                if card.isSelected {
                    base.fill(Color(selectedCardColor))
                }
                
                base.stroke(lineWidth: 2)
                    .foregroundStyle(card.isMatched ? .green : .black)
                
                
                cardContent
                    .foregroundStyle(color)
                
            }
            .padding(card.isSelected ? -3 : 0)
        }
        .background(card.isSelected ? .green : .white)
    }
    
    private var cardContent: some View {
        VStack {
            ForEach(0..<card.number.rawValue, id: \.self) { _ in
                shape
                    .aspectRatio(2/1, contentMode: .fit)
                    .minimumScaleFactor(0.01)
                    .opacity(card.shading == .stripped ? 0.5 : 1)
            }
        }
        .padding()
    }
    
    // Optimizible
    @ViewBuilder
    private var shape: some View {
        if card.shape == .diamond {
            if card.shading == .outlined {
                Diamond()
                    .stroke(lineWidth: 2)
            } else {
                Diamond()
            }
        } else if card.shape == .oval {
            if card.shading == .outlined {
                Capsule()
                    .stroke(lineWidth: 2)
            } else {
                Capsule()
            }
        } else if card.shape == .squiggle {
            if card.shading == .outlined {
                Rectangle()
                    .stroke(lineWidth: 2)
            } else {
                Rectangle()
            }
        }
    }
    
    var color: Color {
        switch card.color {
            case .red:
                return Color.red
            case .purple:
                return Color.purple
            case .green:
                return Color.green
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static let game = SetGameViewModel()
    static var previews: some View {
        let card = game.cards.first!

        return CardView(card: card)
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
