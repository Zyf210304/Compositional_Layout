//
//  Home.swift
//  Compositional_Layout
//
//  Created by 亚飞 on 2021/1/29.
//

import SwiftUI

struct Home: View {
    
    @StateObject var jsonModel = JSONViewModel()
    
    var body: some View {
        
        VStack {
            
            HStack {
                HStack {
                    
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $jsonModel.search)
                }
                .padding(.vertical)
                .padding(.horizontal)
                .background(Color.primary.opacity(0.06))
                .cornerRadius(10)
                
                Button(action: {}, label: {
                    
                    Image(systemName: "qrcode.viewfinder")
                        .font(.system(size: 30))
                        .foregroundColor(.primary)
                })
            }
            .padding()
            
            if jsonModel.cards.isEmpty {
                
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            else {
                
                ScrollView {
                    
                    VStack(spacing: 4, content: {
                        
                        Layout1(cards: jsonModel.cards)
                            
                    })
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
