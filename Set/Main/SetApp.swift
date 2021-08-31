//
//  SetApp.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import SwiftUI

@main
struct SetApp: App {
    let game = SetMatchingGame()
    
    var body: some Scene {
        WindowGroup {
            SetGameView(game: game)
        }
    }
}
