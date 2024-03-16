//
//  SetGame.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 08.03.2024.
//

import Foundation

struct SetGameModel {
    private(set) var cards: Array<Card>
    
    init(_ featuresFactory: () -> Features) {
        self.cards = []
        
        for i in 0..<25 {
            let card = Card(id: i, features: featuresFactory())
            cards.append(card)
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    
    struct Card: Identifiable {
        let features: Features
        var isSelected: Bool = false
        var id: Int
        var state: CardState = .fresh
        
        init(id: Int, features: Features) {
            self.id = id
            self.features = features
        }
    }
    
    enum CardState {
        case fresh, playing, matched
    }
    
    struct Features {
        let shape: String
        let shading: String
        let number: Int
        let color : String
        
        init(_ shape: String, _ shading: String, _ number: Int, _ color: String) {
            self.shape = shape
            self.shading = shading
            self.number = number
            self.color = color
        }
    }
}
