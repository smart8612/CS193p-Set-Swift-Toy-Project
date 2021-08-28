//
//  Stripe.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import SwiftUI

struct Stripe: View {
    var numberOfStripes: Int
    var isEvenNumber: (Int) -> Bool = {
        return $0 % 2 == 0
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<numberOfStripes) { index in
                if isEvenNumber(index) {
                    Rectangle()
                } else {
                    Rectangle().foregroundColor(.white)
                }
            }
        }
    }
}

struct StripeRectangle_Previews: PreviewProvider {
    static var previews: some View {
        Stripe(numberOfStripes: 39)
    }
}
