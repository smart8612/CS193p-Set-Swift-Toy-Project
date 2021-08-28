//
//  Diamond.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import SwiftUI

struct Diamond: Shape {
    var size: CGSize
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let width = size.width
        let height = size.height
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
        Diamond(size: CGSize(width: 150, height: 120))
            .stroke(lineWidth: 3)
    }
}
