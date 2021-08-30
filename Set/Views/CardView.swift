//
//  CardView.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/30.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(lineWidth: 5)
            VStack(spacing: 0) {
                ForEach(0..<card.count.rawValue) { _ in
                    switch card.shape {
                    case CardShape.diamond:
                        switch card.shading {
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
                        switch card.shading {
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
                        switch card.shading {
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
        .foregroundColor(card.color.color)
    }
    
    /// Cards Domain Count
    enum CardCount: Int, CaseIterable {
        case one = 1, two, three
    }
    
    /// Card's Domain Shape
    enum CardShape: CaseIterable {
        case squiggle, diamond, oval
    }
    
    /// Card's Domain Shading
    enum CardShading: CaseIterable {
        case solid, striped, open
    }
    
    /// Card's Domain Color
    struct CardColor: CaseIterable {
        static var allCases = [red, green, blue]
        
        let color: Color
        static let red = CardColor(color: .red)
        static let green = CardColor(color: .green)
        static let blue = CardColor(color: .blue)
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var count: CardCount
        var shape: CardShape
        var shading: CardShading
        var color: CardColor
    }
}
