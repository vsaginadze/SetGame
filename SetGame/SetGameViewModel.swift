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

    var cards: Array<Card> {
        model.dealedCards
    }
    
    // MARK: Intents
    func addThreeCards() {
        model.deal()
    }
    
    func startNewGame() {
        // 
    }
    
    func shuffle() {
        model.shuffle()
    }
}
