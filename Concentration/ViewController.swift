//
//  ViewController.swift
//  Concentration
//
//  Created by Art on 30.09.2021.
//

import UIKit

class ViewController: UIViewController {

//MARK: - Outlets
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var countTapsLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    
//MARK: - Properties

    private var touches = 0 {
        didSet {
            countTapsLabel.text = "Количество нажатий \(touches)"
        }
    }
    
//MARK: - Action
    
    @IBAction func buttoAction(_ sender: UIButton) {
        touches += 1
    }
}

