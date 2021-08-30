//
//  SetGameView.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import SwiftUI

struct SetGameView: View {
    var body: some View {
        HStack {
            CardView()
        }
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(lineWidth: 5)
            VStack(spacing: 0) {
//                stripeDiamond.aspectRatio(2, contentMode: .fit)
//                Diamond().stripe(numberOfLines: 100, borderWidth: 25)
//                Circle().stripe(numberOfLines: 100, borderWidth: 25)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
    }
}
