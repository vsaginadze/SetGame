//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 12.03.2024.
//

import Foundation

class SetGameViewModel: ObservableObject {
    typealias Card = SetGameModel.Card
    @Published var model: SetGameModel = SetGameModel()
    
    var allCardsArePresent = false
    var noMoreCards: Bool {
        if model.isThereMoreCards() || allCardsArePresent {
            allCardsArePresent = true
            return true
        }
        return false
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
        model = SetGameModel()

    }
    
    func shuffle() {
        model.shuffle()
    }
}
