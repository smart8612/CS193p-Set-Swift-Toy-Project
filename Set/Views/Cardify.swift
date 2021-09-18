//
//  Cardify.swift
//  Set
//
//  Created by JeongTaek Han on 2021/09/18.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isChosen: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let backShape = RoundedRectangle(cornerRadius: 25)
            if isChosen {
                backShape.foregroundColor(.gray)
                         .shadow(color: .accentColor, radius: 20, x: 0.0, y: 0.0)
            } else {
                backShape.foregroundColor(.white)
            }
            backShape.strokeBorder(lineWidth: 5)
            content
            if isChosen {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 90-90))
                    .padding(10)
                    .opacity(0.7)
                    .foregroundColor(.primary)
            }
        }
    }
}
