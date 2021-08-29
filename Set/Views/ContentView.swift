//
//  ContentView.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(lineWidth: 5)
            VStack(spacing: 0) {
                stripeDiamond
                stripeDiamond
                stripeCircle
            }
        }
    }
    
    var stripeDiamond: some View {
        Stripe(numberOfStripes: 100)
            .clipShape(Diamond())
            .overlay(Diamond()
            .stroke(Color.black, lineWidth: 10.0))
            .padding()
    }
    
    var stripeCircle: some View {
        Stripe(numberOfStripes: 100)
            .clipShape(Capsule())
            .overlay(Capsule()
            .stroke(Color.black, lineWidth: 10.0))
            .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
