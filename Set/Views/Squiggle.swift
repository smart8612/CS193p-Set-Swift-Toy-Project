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
        
        p.move(to: CGPoint(x: rect.origin.x, y: rect.maxY / 2))
        p.addQuadCurve(
            to: CGPoint(x: rect.midX / 2, y: rect.minY),
            control: CGPoint()
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.midY),
            control: CGPoint(x: rect.midX, y: rect.minY)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.midX * 1.5, y: rect.maxY),
            control: CGPoint(x: rect.midX, y: rect.maxY)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.midY),
            control: CGPoint(x: rect.maxX, y: rect.maxY)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.midX * 1.5, y: rect.minY),
            control: CGPoint(x: rect.maxX, y: rect.minY)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.midY),
            control: CGPoint(x: rect.midX, y: rect.minY)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.midX * 0.5, y: rect.maxY),
            control: CGPoint(x: rect.midX, y: rect.maxY)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.midY),
            control: CGPoint(x: rect.minX, y: rect.maxY)
        )
        
        return p
    }
    
}

struct Squiggle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Squiggle()
            Squiggle()
            Squiggle()
        }
    }
}
