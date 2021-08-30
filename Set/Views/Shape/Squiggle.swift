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
        
        p.move(to: CGPoint(x: rect.minX, y: rect.maxY * 0.5))
        p.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.maxY * 0.2),
            control: CGPoint(x: rect.minX, y: rect.minY)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.maxX * 0.8, y: rect.maxY * 0.15),
            control: CGPoint(x: rect.maxX * 0.65, y: rect.maxY * 0.25)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.maxY * 0.2),
            control: CGPoint(x: rect.maxX * 0.98, y: rect.minY)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.maxY * 0.65),
            control: CGPoint(x: rect.maxX, y: rect.maxY)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.maxX * 0.18, y: rect.maxY * 0.7),
            control: CGPoint(x: rect.maxX * 0.3, y: rect.maxY * 0.5)
        )
        p.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY * 0.5),
            control: CGPoint(x: rect.minX, y: rect.maxY)
        )

        
        return p
    }
    
}

struct Squiggle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            Squiggle().padding()
            Squiggle()
            Squiggle().stroke(lineWidth: 5)
        }
    }
}
