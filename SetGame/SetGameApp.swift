//
//  SetGameApp.swift
//  SetGame
//
//  Created by Vakhtang Saginadze on 04.03.2024.
//

import SwiftUI

@main
struct SetGameApp: App {
    @StateObject var game: SetGameViewModel = SetGameViewModel()
    var body: some Scene {
        WindowGroup {
            SetGameView(game: SetGameViewModel())
        }
    }
}
