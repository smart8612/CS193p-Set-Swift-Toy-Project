//
//  ViewExtension.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/30.
//

import Foundation
import SwiftUI

extension Shape {
    func stripe(numberOfLines: Int, borderWidth: CGFloat) -> some View {
        Stripe(numberOfStripes: numberOfLines)
            .clipShape(self)
            .overlay(self
            .stroke(lineWidth: borderWidth))
    }
}
