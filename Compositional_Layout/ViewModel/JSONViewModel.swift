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
    init() {
        fetchJSON()
    }
    
    func fetchJSON() {
        
        let url = "https://picsum.photos/v2/list?page=2&limit=100"
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, _) in
            
            guard let json = data else {return}
            
            let jsonValues = try? JSONDecoder().decode([Card].self, from: json)
            
            guard let cards = jsonValues else { return }
            
            DispatchQueue.main.async {
                self.cards = cards
                print(cards)
            }
        }
        .resume()
    }
}
