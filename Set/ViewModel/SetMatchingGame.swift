//
//  SetMatchingGame.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/31.
//

import Foundation
import SwiftUI

class SetMatchingGame: ObservableObject {
    typealias Card = SetGame.Card
    
    @Published private(set) var model = SetGame()
    
    var cards: [Card] {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func restart() {
        model = SetGame()
    }
    
    func getColor(of card: Card) -> Color {
        switch card.color {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        }
    }
}
