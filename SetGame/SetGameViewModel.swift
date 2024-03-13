//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 12.03.2024.
//

import Foundation

class SetGameViewModel: ObservableObject {
    typealias Card = SetGameModel.Card
    
    private static let numberOfDisplayedCards: Int = 81
    
    init() {
        model = SetGameViewModel.createSetGame()
    }
    
    private static func createSetGame() -> SetGameModel {
        SetGameModel(numberOfDisplayedCards: numberOfDisplayedCards)
    }
    
    @Published var model: SetGameModel
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: Intents
    
    func addThreeCards() {
        // model.addThreeCards()
    }
    
    func startNewGame() {
        // 
    }
    
    func shuffle() {
        model.shuffle()
    }
}
