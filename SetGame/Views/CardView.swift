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
            
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 2)
                
                cardContent
                    .foregroundStyle(color)
            }
        }
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
