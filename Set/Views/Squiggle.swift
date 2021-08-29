//
//  Squiggle.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import SwiftUI

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        p.move(to: CGPoint(x: rect.midX * 0.2, y: rect.maxY))
        p.addQuadCurve(
            to: CGPoint(x: rect.midX * 1.2, y: rect.maxY * 0.25),
            control: CGPoint(x: rect.origin.x, y: rect.midY * 0.25)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.maxX * 0.75, y: rect.origin.y),
            control: CGPoint(x: rect.midX * 1.25, y: rect.midY * 0.5)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.maxX * 0.75, y: rect.maxY * 0.75),
            control: CGPoint(x: rect.maxX, y: rect.midY)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.midX * 0.8, y: rect.maxY * 0.75),
            control: CGPoint(x: rect.maxX * 0.6, y: rect.maxY)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.midX * 0.2, y: rect.maxY),
            control: CGPoint(x: rect.midX * 0.4, y: rect.maxY * 0.75)
        )

        
        return p
    }
    
}

struct Squiggle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            Squiggle()
            Squiggle()
            Squiggle()
        }
    }
}
