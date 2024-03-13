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
            ForEach(0..<card.features.number, id: \.self) { _ in
                shape
                    .aspectRatio(2/1, contentMode: .fit)
                    .minimumScaleFactor(0.01)
                    .opacity(getOpacity(card.features.shading))
            }
        }
        .padding()
    }
    
    
    @ViewBuilder
    private var shape: some View {
        if card.features.shape == "diamond" {
            if card.features.shading == "open" {
                Diamond()
                    .stroke(lineWidth: 2)
            } else {
                Diamond()
            }
        } else if card.features.shape == "oval" {
            if card.features.shading == "open" {
                Capsule()
                    .stroke(lineWidth: 2)
            } else {
                Capsule()
            }
        } else if card.features.shape == "rectangle" {
            if card.features.shading == "open" {
                Rectangle()
                    .stroke(lineWidth: 2)
            } else {
                Rectangle()
            }
        }
    }
    
    
    private var color: Color {
        if card.features.color == "orange" {
            return Color.orange
        } else if card.features.color == "red" {
            return Color.red
        } else if card.features.color == "purple" {
            return Color.purple
        }
        
        return Color.orange
    }
    
    private func getOpacity(_ shading: String) -> Double {
        if shading == "solid" || shading == "open" {
            return 1
        } else if shading == "striped" {
            return 0.5
        }
        
        return 1
    }
}

#Preview {
    CardView(card: SetGameModel.Card(id: 1, features: SetGameModel.Features("oval", "solid", 1, "orange")))
}
