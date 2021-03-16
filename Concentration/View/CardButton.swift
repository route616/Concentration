//
//  CardButton.swift
//  Concentration
//
//  Created by Игорь on 03.01.2021.
//

import UIKit

@IBDesignable class CardButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
