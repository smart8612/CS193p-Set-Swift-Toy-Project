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
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(lineWidth: 5)
            
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
                .padding()
            }
        }
    }
    
}

