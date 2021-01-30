//
//  JSONViewModel.swift
//  Compositional_Layout
//
//  Created by 亚飞 on 2021/1/29.
//

import SwiftUI

class JSONViewModel: ObservableObject {
    
    @Published var cards : [Card] = []
    
    @Published var search = ""
    
    @Published var compositionalArray : [[Card]] = []
    init() {
        fetchJSON()
    }
    
    func fetchJSON() {
        
        let url = "https://picsum.photos/v2/list?page=2&limit=80"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, _) in
            
            guard let json = data else {return}
            
            let jsonValues = try? JSONDecoder().decode([Card].self, from: json)
            
            guard let cards = jsonValues else { return }
            
            DispatchQueue.main.async {
                self.cards = cards
                print(cards)
                self.setCompisitonalLayout()
            }
        }
        .resume()
    }
    
    func setCompisitonalLayout() {
        
        var currentArrayCards : [Card] = []
        
        cards.forEach { (card) in
            
            currentArrayCards.append(card)
            
            if currentArrayCards.count == 3 {
                
                compositionalArray.append(currentArrayCards)
                currentArrayCards.removeAll()
            }
            
            if currentArrayCards.count != 3 && card.id == cards.last!.id {
                
                compositionalArray.append(currentArrayCards)
                currentArrayCards.removeAll()
            }
            
        }
    }
}
