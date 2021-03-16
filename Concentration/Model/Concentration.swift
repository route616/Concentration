//
//  Concentration.swift
//  Concentration
//
//  Created by Игорь on 03.01.2021.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()

    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            } // for
        } // set
    } // indexOfOneAndOnlyFaceUpCard

    init(numberOfPairsCards: Int) {
        assert(numberOfPairsCards > 0, "Concentration.init")
        for _ in 1...numberOfPairsCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            } // matchIndex
        } // !isMatched
    }
}

// MARK: - Collection + oneAndOnly property
extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
