//
//  SetGameView.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import SwiftUI

struct SetGameView: View {
    var body: some View {
        HStack {
            CardView(
                cardCount: .three,
                cardShape: .diamond,
                cardShading: .striped,
                cardColor: .blue)
                .foregroundColor(.red)
        }
    }
}

struct CardView: View {
    var cardCount: CardCount
    var cardShape: CardShape
    var cardShading: CardShading
    var cardColor: CardColor
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(lineWidth: 5)
            VStack(spacing: 0) {
                ForEach(0..<cardCount.rawValue) { _ in
                    Circle().stripe()
                        .aspectRatio(2, contentMode: .fit)
                        .padding()
                }
            }
        }
        .foregroundColor(cardColor.rawValue)
    }
    
    
    /// Cards Domain Count
    enum CardCount: Int {
        case one = 1, two, three
    }
    
    /// Card's Domain Shape
    enum CardShape {
        case squiggle, diamond, oval
    }
    
    /// Card's Domain Shading
    enum CardShading {
        case solid, striped, open
    }
    
    /// Card's Domain Color
    struct CardColor {
        let rawValue: Color
        static let red = CardColor(rawValue: .red)
        static let green = CardColor(rawValue: .green)
        static let blue = CardColor(rawValue: .blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
            .preferredColorScheme(.dark)
    }
}
