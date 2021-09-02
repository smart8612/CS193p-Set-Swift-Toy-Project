//
//  SetGame.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import Foundation

struct SetGame {
    var cards: Array<Card>
    
    init() {
        cards = []
        var index = 0
        for count in Card.Count.allCases {
            for shape in Card.Shape.allCases {
                for shading in Card.Shading.allCases {
                    for color in Card.Color.allCases {
                        cards.append(SetGame.Card(
                            id: index,
                            count: count,
                            shape: shape,
                            shading: shading,
                            color: color))
                        index += 1
                    }
                }
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            cards[chosenIndex].isChosen.toggle()
            print(cards[chosenIndex])
        } else {
            print("Not Exist")
        }
    }
    
    
    // Mark - Implement view cards (12)
    func getCards() -> [Card] {
        
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isChosen = false
        var isMatched = false
        
        var count: Count
        var shape: Shape
        var shading: Shading
        var color: Color
        
        /// Cards Domain Count
        enum Count: Int, CaseIterable {
            case one = 1, two, three
        }
        
        /// Card's Domain Shape
        enum Shape: CaseIterable {
            case squiggle, diamond, oval
        }
        
        /// Card's Domain Shading
        enum Shading: CaseIterable {
            case solid, striped, open
        }
        
        /// Card's Domain Color
        enum Color: CaseIterable {
            case red, green, blue
        }
    }
}
