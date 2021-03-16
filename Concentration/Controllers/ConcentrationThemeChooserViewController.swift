//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Игорь on 27.01.2021.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    let themes = [
        "Sports": "⚽️🏀🥊🏓🎱🏐🏒⛸",
        "Faces": "😆🙃🙂😍😜😉😭😡",
        "Animals": "🐶🐱🐰🦊🐻🐷🐮🐵",
        "Halloween": "🎃👻🧛🏻‍♂️🦇🕷⚰️👽🧟‍♂️"
    ]
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseTheme" {
            guard let themeName = (sender as? UIButton)?.currentTitle else { return }
            guard let theme = themes[themeName] else { return }
            guard let cvc = (segue.destination as? ConcentrationViewController) else { return }
            
            cvc.theme = theme
        }
    }
}
