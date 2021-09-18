//
//  CardView.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/31.
//

import SwiftUI

struct CardView: View {
    let card: SetMatchingGame.Card
    
    var body: some View {
        ZStack {
            let backShape = RoundedRectangle(cornerRadius: 25)
            
            if card.isChosen {
                backShape.foregroundColor(.gray)
                         .shadow(color: .accentColor, radius: 20, x: 0.0, y: 0.0)
            } else {
                backShape.foregroundColor(.white)
            }
            
            backShape.strokeBorder(lineWidth: 5)
            
            VStack(spacing: 0) {
                ForEach(0..<card.count.rawValue) { _ in
                    switch card.shape {
                    case .diamond:
                        switch card.shading {
                        case .solid:
                            Diamond().fill()
                        case .striped:
                            Diamond().stripe()
                        case .open:
                            Diamond().stroke()
                        }
                        
                    case .oval:
                        switch card.shading {
                        case .solid:
                            Capsule().fill()
                        case .striped:
                            Capsule().stripe()
                        case .open:
                            Capsule().stroke()
                        }
                        
                    case .squiggle:
                        switch card.shading {
                        case .solid:
                            Squiggle().fill()
                        case .striped:
                            Squiggle().stripe()
                        case .open:
                            Squiggle().stroke()
                        }
                    }
                }
                .aspectRatio(2, contentMode: .fit)
                .padding(12)
            }
            
            if card.isChosen {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 90-90))
                    .padding(5)
                    .opacity(0.7)
                    .foregroundColor(.primary)
            }
        }
    }
}
