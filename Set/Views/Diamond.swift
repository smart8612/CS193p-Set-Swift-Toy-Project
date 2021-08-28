//
//  Diamond.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let width = rect.size.width / 2
        let height = rect.size.height / 2
        let points = [
            CGPoint(x: center.x + width, y: center.y),
            CGPoint(x: center.x, y: center.y + height),
            CGPoint(x: center.x - width, y: center.y),
            CGPoint(x: center.x, y: center.y - height),
            CGPoint(x: center.x + width, y: center.y)
        ]
        
        var p = Path()
        
        p.move(to: points.first!)
        points.forEach { p.addLine(to: $0) }
        p.closeSubpath()
        
        return p
    }
}

struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        Diamond().stroke(lineWidth: 3)
    }
}
