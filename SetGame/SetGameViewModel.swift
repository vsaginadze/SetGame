//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 12.03.2024.
//

import Foundation
import SwiftUI

class SetGameViewModel: ObservableObject {
    typealias Card = SetGameModel.Card
    @Published var model: SetGameModel = SetGameModel() {
        didSet {
            if !model.willDealCards.isEmpty {
                let cards = model.willDealCards.removeLast()
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                    withAnimation {
                        self.model.dealedCards.removeAll { card in
                            return cards.0.id == card.id || cards.1.id == card.id || cards.2.id == card.id
                        }
                    }
                }
            }
        }
    }
    
    var noMoreCards: Bool {
        return model.isThereMoreCards()
    }
    
    var cards: Array<Card> {
        model.dealedCards
    }
    
    // MARK: Intents
    func addThreeCards() {
        model.deal()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    
    func startNewGame() {
        model.startNewGame()
    }
    
    func shuffle() {
        model.shuffle()
    }
}
