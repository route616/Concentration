//
//  Card.swift
//  Concentration
//
//  Created by Игорь on 03.01.2021.
//

import Foundation

struct Card {
    private static var idFactory = 0
    private var id: Int
    
    var isFaceUp = false
    var isMatched = false
    
    private static func getUniqueID() -> Int {
        Card.idFactory += 1
        return Card.idFactory
    }
    
    init() {
        self.id = Card.getUniqueID()
    }
}

// MARK: - Card + Hashable
extension Card: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
}
