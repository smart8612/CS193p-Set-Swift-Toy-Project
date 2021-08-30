//
//  SetGameView.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import SwiftUI

struct SetGameView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(lineWidth: 5)
            VStack(spacing: 0) {
                stripeDiamond.aspectRatio(2, contentMode: .fit)
            }
        }
    }
    
    var stripeDiamond: some View {
        Stripe(numberOfStripes: 100)
            .clipShape(Diamond())
            .overlay(Diamond()
            .stroke(Color.black, lineWidth: 10.0))
    }
    
    var stripeCapsule: some View {
        Stripe(numberOfStripes: 100)
            .clipShape(Capsule())
            .overlay(Capsule()
            .stroke(Color.black, lineWidth: 10.0))
    }
    
    var stripeSquiggle: some View {
        Stripe(numberOfStripes: 100)
            .clipShape(Squiggle())
            .overlay(Squiggle()
            .stroke(Color.black, lineWidth: 10.0))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
    }
}
