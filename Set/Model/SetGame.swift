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
        /// 카드 배열을 생성한다.
        cards = []
        preCards = []
        
        /// 예비 카드 배열에 모든 카드 덱을 생성한다.
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
        
        /// 순서대로 생성된 카드덱을 섞어준다. 실제로 게임할 때에도 섞고난 후에 배정하는 것을 상상해보자!
        preCards.shuffle()
        
        /// 예비 카드 중 화면에 뿌릴 만큼 카드(일단: 12개)를 선택하여 게임 판에 깔아둔다.
        for _ in 0..<12 {
            let card = preCards.removeFirst()
            cards.append(card)
        }
        
        print("카드의 개수: \(cards.count)")
        print("예비 카드의 개수: \(preCards.count)")
        print("생성된 총 카드의 수: \(cards.count + preCards.count)")
    }
    
    private var chosenCards: Set<Int> = []
    
    // Mark - IsMatched 프로퍼티를 활용하여 카드가 매칭되었는지 확인하는 로직구현
    mutating func choose (_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            // 선택된 카드에 관하여 사용자 의도를 우선 처리한다.
            // 이미 선택된 카드라면
            if cards[chosenIndex].isChosen {
                // 해당 카드의 선택을 다시 취소한다.
                cards[chosenIndex].isChosen.toggle()
                // 선택된 카드 배열에서 해당 카드를 찾아 제거한다.
                chosenCards.remove(chosenIndex)
                
            } else {
                // 기존에 선택하지 않은 카드였다면
                // 해당 카드의 isChosen 프로퍼티를 활성화 하고
                cards[chosenIndex].isChosen.toggle()
                // chosenCards 집합에 해당 카드 인덱스를 추가한다
                chosenCards.insert(chosenIndex)
                
            }
            
            // 게임 로직: 우선 3가지 조합이 모여서 조건을 검사해야하는 경우
            if chosenCards.count == 3 {
                // 집합에 인덱스로 접근할 수 있도록 배열 변환
                let indices = [Int](chosenCards)
                
                // 3개의 카드를 골라서
                let firstCard = cards[indices[0]]
                let secondCard = cards[indices[1]]
                let thirdCard = cards[indices[2]]
                
                // 카드의 각 속성이 모두 동일하거나 다른 경우 즉, 카드가 Set을 만족한 경우
                if (firstCard.shape == secondCard.shape && secondCard.shape == thirdCard.shape) ||
                   (firstCard.shape != secondCard.shape && secondCard.shape != thirdCard.shape) ||
                   (firstCard.color == secondCard.color && secondCard.color == thirdCard.color) ||
                   (firstCard.color != secondCard.color && secondCard.color != thirdCard.color) ||
                   (firstCard.count == secondCard.count && secondCard.count == thirdCard.count) ||
                   (firstCard.count != secondCard.count && secondCard.count != thirdCard.count) ||
                   (firstCard.shading == secondCard.shading && secondCard.shading == thirdCard.shading) ||
                   (firstCard.shading != secondCard.shading && secondCard.shading != thirdCard.shading) {
                    for i in chosenCards {
                        cards.remove(at: i)
                        cards.insert(preCards.removeFirst(), at: i)
                    }
                    chosenCards.removeAll()
                    
                } else {
                    // 선택된 카드 조합이 set 조건을 만족하지 않는 경우
                    print("Set을 충족하지 않은 조합입니다.")
                    for i in chosenCards {
                        cards[i].isChosen = false
                    }
                    chosenCards.removeAll()
                }
            }
            
        } else {
            print("선택한 카드가 모델에 존재하지 않습니다.")
            
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
