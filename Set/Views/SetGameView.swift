//
//  SetGameView.swift
//  Set
//
//  Created by JeongTaek Han on 2021/08/28.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game: SetMatchingGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .foregroundColor(game.getColor(of: card))
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetMatchingGame()
        SetGameView(game: game)
            .preferredColorScheme(.dark)
    }
}
