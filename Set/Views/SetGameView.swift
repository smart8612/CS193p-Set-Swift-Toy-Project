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
        VStack {
            Text("SetGame").font(.largeTitle)
            
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .padding(3)
                    .foregroundColor(game.getColor(of: card))
                    .onTapGesture {
                        game.choose(card)
                    }
            }
                    
            HStack {
                Text("Score: \(game.score)").font(.largeTitle)
                Spacer()
                Button(action: { game.restart() }) {
                    Text("New Game").font(.largeTitle)
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
