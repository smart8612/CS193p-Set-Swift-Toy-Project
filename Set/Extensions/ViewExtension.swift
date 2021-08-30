//
//  ViewExtension.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/30.
//

import Foundation
import SwiftUI

/*
 View와 관련된 프로토콜에 대하여 코드의 중복을 줄이기 위해
 별도의 extension으로 한번만 구현해두고 재사용 하려고 함
 */
extension Shape {
    /// set shape background to stripe pattern
    /// - Parameters:
    ///   - numberOfLines: the number of background lines (default: 100)
    ///   - borderWidth: shape border width (default: 25)
    /// - Returns: some View
    func stripe(numberOfLines: Int = 100, borderWidth: CGFloat = 25) -> some View {
        Stripe(numberOfStripes: numberOfLines)
            .clipShape(self)
            .overlay(self
            .stroke(lineWidth: borderWidth))
    }
}
