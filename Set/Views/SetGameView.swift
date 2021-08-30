//
//  SetGameView.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import SwiftUI

struct SetGameView: View {
    var cards: [CardView.Card] {
        var a: [CardView.Card] = []
        var index = 0
        for count in CardView.CardCount.allCases {
            for shape in CardView.CardShape.allCases {
                for shading in CardView.CardShading.allCases {
                    for color in CardView.CardColor.allCases {
                        a.append(CardView.Card(
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
        return a
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(cards) { card in
                    CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
            .preferredColorScheme(.dark)
    }
}
