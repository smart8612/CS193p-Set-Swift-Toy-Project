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
                stripeDiamond
            }
        }
    }
    
    var stripeDiamond: some View {
        GeometryReader { geometry in
            ZStack {
                let size = CGSize(
                    width: geometry.size.width / 2.5,
                    height: geometry.size.height / 3)
                
                Stripe(numberOfStripes: 100)
                    .clipShape(Diamond(size: size))
                Diamond(size: size)
                    .stroke(Color.black, lineWidth: 10.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
