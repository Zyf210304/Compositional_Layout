//
//  ContextModifier.swift
//  Compositional_Layout
//
//  Created by 张亚飞 on 2021/1/30.
//

import SwiftUI

struct ContextModifier: ViewModifier {
    
    var card: Card
    
    func body(content: Content) -> some View {
        
        content
            .contextMenu(ContextMenu(menuItems: {
            
            Text("By \(card.author)")
        }))
            .contentShape(RoundedRectangle(cornerRadius: 0))
        
    }
}
