//
//  SetGame.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import Foundation

struct SetGame {
    var cards: Array<Card>
    private var preCards: Array<Card>
    
    init() {
        cards = []
        preCards = []
        var index = 0
        for count in Card.Count.allCases {
            for shape in Card.Shape.allCases {
                for shading in Card.Shading.allCases {
                    for color in Card.Color.allCases {
                        preCards.append(SetGame.Card(
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
        
        preCards.shuffle()
        
        for _ in 0..<12 {
            let card = preCards.removeFirst()
            cards.append(card)
        }
        
        print("카드의 개수: \(cards.count)")
        print("예비 카드의 개수: \(preCards.count)")
        print("생성된 총 카드의 수: \(cards.count + preCards.count)")
    }
    
    // Mark - IsMatched 프로퍼티를 활용하여 카드가 매칭되었는지 확인하는 로직구현
    mutating func choose (_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            cards[chosenIndex].isChosen.toggle()
            print(cards[chosenIndex])
        } else {
            print("Not Exist")
        }
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
