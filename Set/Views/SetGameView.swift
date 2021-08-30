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
                cardShape: .squiggle,
                cardShading: .open,
                cardColor: .blue
            )
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
                    switch cardShape {
                    case CardShape.diamond:
                        switch cardShading {
                        case CardShading.solid:
                            Diamond().fill()
                                .aspectRatio(2, contentMode: .fit)
                                .padding()
                        case CardShading.striped:
                            Diamond().stripe()
                                .aspectRatio(2, contentMode: .fit)
                                .padding()
                        case CardShading.open:
                            Diamond().stroke()
                                .aspectRatio(2, contentMode: .fit)
                                .padding()
                        }
                    case CardShape.oval:
                        switch cardShading {
                        case CardShading.solid:
                            Capsule().fill()
                                .aspectRatio(2, contentMode: .fit)
                                .padding()
                        case CardShading.striped:
                            Capsule().stripe()
                                .aspectRatio(2, contentMode: .fit)
                                .padding()
                        case CardShading.open:
                            Capsule().stroke()
                                .aspectRatio(2, contentMode: .fit)
                                .padding()
                        }
                    case CardShape.squiggle:
                        switch cardShading {
                        case CardShading.solid:
                            Squiggle().fill()
                                .aspectRatio(2, contentMode: .fit)
                                .padding()
                        case CardShading.striped:
                            Squiggle().stripe()
                                .aspectRatio(2, contentMode: .fit)
                                .padding()
                        case CardShading.open:
                            Squiggle().stroke()
                                .aspectRatio(2, contentMode: .fit)
                                .padding()
                        }
                    }
                }
            }
        }
        .foregroundColor(cardColor.color)
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
        let color: Color
        static let red = CardColor(color: .red)
        static let green = CardColor(color: .green)
        static let blue = CardColor(color: .blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
            .preferredColorScheme(.dark)
    }
}
