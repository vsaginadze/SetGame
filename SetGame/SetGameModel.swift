//
//  SetGame.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 08.03.2024.
//

import Foundation

struct SetGameModel {
    private var deck: Deck
    private var remaininigCards: Int = 81
    var willDealCards: Array<(Card,Card,Card)>
    var dealedCards: Array<Card>
    
    init() {
        willDealCards = []
        dealedCards = []
        deck = Deck()
        
        deal(12)
    }
    
    mutating func startNewGame() {
        willDealCards = []
        dealedCards = []
        deck = Deck()
        deal(12)
    }
    
    mutating func choose(_ card: Card) {
        if let selectedCardIdx = dealedCards.firstIndex(where: {$0.id == card.id}) {
            // OPTIMIZE
            var numberOfSelectedCards = 0
            for card in dealedCards {
                if card.isSelected {
                    numberOfSelectedCards += 1
                }
            }
            
            if numberOfSelectedCards == 3 {
                for idx in 0..<dealedCards.count {
                    if dealedCards[idx].isSelected {
                        dealedCards[idx].isSelected.toggle()
                    }
                }
                numberOfSelectedCards = 0
            }
            
            dealedCards[selectedCardIdx].isSelected.toggle()
        }
        
        var numberOfSelectedCards = 0
        for card in dealedCards {
            if card.isSelected {
                numberOfSelectedCards += 1
            }
        }
        
        if numberOfSelectedCards == 3 {
            check()
        }
    }
    
    func isThereMoreCards() -> Bool {
        return remaininigCards == 0
    }
    
    mutating func check() {
        let selectedCards = dealedCards.filter { $0.isSelected }
        let isSet: Bool = isSet(selectedCards)
        
        if isSet {
            for idx in 0..<dealedCards.count {
                if dealedCards[idx].isSelected {
                    dealedCards[idx].isMatched.toggle()
                }
            }
        }
        
        let willDealArray = self.dealedCards.filter { $0.isMatched }
        print(willDealArray)
        if !willDealArray.isEmpty {
            willDealCards.append((willDealArray[0], willDealArray[1], willDealArray[2]))
        }
    }
    
    func isSet(_ selectedCards: Array<Card>) -> Bool {
        let shapes = selectedCards.map { $0.shape }
        let colors = selectedCards.map { $0.color }
        let numbers = selectedCards.map { $0.number }
        let shadings = selectedCards.map { $0.shading }
        
        var shapeMakesSet: Bool
        var colorMakesSet: Bool
        var numberMakesSet: Bool
        var shadingMakesSet: Bool
        
        shapeMakesSet = propertyMakesSet(shapes)
        colorMakesSet = propertyMakesSet(colors)
        shadingMakesSet = propertyMakesSet(shadings)
        numberMakesSet = propertyMakesSet(numbers)
        
        return shapeMakesSet && colorMakesSet && shadingMakesSet && numberMakesSet
    }
    
    func propertyMakesSet<T: Equatable>(_ properties: Array<T> ) -> Bool {
        return properties.allSatisfy { $0 == properties.first } || allItemsAreDifferent(properties)
    }
    
    func allItemsAreDifferent<T: Equatable>(_ array: [T]) -> Bool {
        for (index, item) in array.enumerated() {
            for otherIndex in (index + 1)..<array.count {
                if item == array[otherIndex] {
                    return false
                }
            }
        }
        return true
    }
    
    mutating func shuffle() {
        dealedCards.shuffle()
    }

    mutating func deal(_ n: Int = 3) {
        remaininigCards -= n
        for _ in 0..<n {
            guard let card = deck.getCard() else {
                return
            }
            dealedCards.append(card)
        }
    }
    
    struct Deck {
        private var cards = [Card]()
        
        init() {
            for number in Number.allCases {
                for color in Color.allCases {
                    for shape in Shape.allCases {
                        for shading in Shading.allCases {
                            cards.append(Card(shape: shape, shading: shading, number: number, color: color))
                        }
                    }
                }
            }
            cards.shuffle()
        }
        
        mutating func getCard() -> Card? {
            guard cards.count > 0 else {
                return nil
            }
            return cards.removeFirst()
        }
    }
    
    struct Card: Identifiable {
        let shape: Shape
        let shading: Shading
        let number: Number
        let color : Color
        
        var isSelected: Bool = false
        var isMatched: Bool = false
        
        var id = UUID()
    }
    
    enum Number: Int, CaseIterable {
        case one = 1, two, three
    }

    enum Color: String, CaseIterable, Hashable {
        case red = "🟥", blue = "🟦", yellow = "🟨"
    }

    enum Shading: String, CaseIterable, Hashable {
        case solid, stripped, outlined
    }

    enum Shape: String, CaseIterable, Hashable {
        case oval , squiggle, diamond
    }
}
