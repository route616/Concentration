//
//  ViewController.swift
//  Concentration
//
//  Created by Игорь on 31.12.2020.
//

import UIKit

class ConcentrationViewController: UIViewController {
    private lazy var game = Concentration(numberOfPairsCards: numberOfPairsCards)
    private var numberOfPairsCards: Int {
        return cardButtons.count / 2
    }
    private var _emojies = "🎃👻🧛🏻‍♂️🦇🕷⚰️👽🧟‍♂️"
    private var emojies = [Card: String]()
    private var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var theme: String? {
        didSet {
            _emojies = theme ?? ""
            emojies = [:]
            updateViewFromModel()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!

    // MARK: - Actions
    @IBAction private func touchCard(_ sender: UIButton) {
        guard let cardNumber = cardButtons.firstIndex(of: sender) else { return }
        flipCount += 1
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0, .strokeColor: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        ]
        let attributedString = NSAttributedString(
            string: "Flips: \(flipCount)", attributes: attributes
        )
        flipCountLabel.attributedText = attributedString
    }

    private func updateViewFromModel() {
        guard let cardButtons = cardButtons else { return }
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
            }
        }
    }

    private func emoji(for card: Card) -> String {
        if emojies[card] == nil, _emojies.count > 0 {
            let randomStringIndex = _emojies.index(
                _emojies.startIndex, offsetBy: _emojies.count.arc4random
            )
            emojies[card] = String(_emojies.remove(at: randomStringIndex))
        }
        return emojies[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
