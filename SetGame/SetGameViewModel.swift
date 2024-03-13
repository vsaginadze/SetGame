//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 12.03.2024.
//

import Foundation

class SetGameViewModel: ObservableObject {
    typealias Card = SetGameModel.Card
    typealias CardFeatures = SetGameModel.Features
    
    init() {
        model = SetGameViewModel.createSetGame()
    }
    
    private static func createSetGame() -> SetGameModel {
        SetGameModel(numberOfDisplayedCards: numberOfDisplayedCards) {
            let shape = shapes.randomElement() ?? "oval"
            let shading = shading.randomElement() ?? "solid"
            let color = colors.randomElement() ?? "orange"
            let number = Int.random(in: 1...3)
            
            return CardFeatures(shape, shading, number, color)
        }
    }
    
    @Published var model: SetGameModel
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: Optimizible
    private static let numberOfDisplayedCards: Int = 4
    private static let shapes = ["oval", "diamond", "rectangle"]
    private static let shading = ["solid", "striped", "open"]
    private static let colors = ["orange", "red", "purple"]
    
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
