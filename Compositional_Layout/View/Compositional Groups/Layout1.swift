//
//  Layout1.swift
//  Compositional_Layout
//
//  Created by 亚飞 on 2021/1/29.
//

import SwiftUI
import SDWebImageSwiftUI

var width = UIScreen.main.bounds.width - 30

struct Layout1: View {
    
    var cards: [Card]
    var body: some View {
        
        HStack(spacing: 4, content: {
            
            AnimatedImage(url: URL(string: cards[0].download_url))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: (width - (width / 3) + 4), height: 250)
                .cornerRadius(4)
            
            VStack( spacing: 4, content: {
                
                AnimatedImage(url: URL(string: cards[1].download_url))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: ((width / 3)), height: 123)
                    .cornerRadius(4)
                
                AnimatedImage(url: URL(string: cards[2].download_url))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: ((width / 3)), height: 123)
                    .cornerRadius(4)
            })
        })
    }
}



struct Layout1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
