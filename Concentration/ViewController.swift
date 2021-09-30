//
//  ViewController.swift
//  Concentration
//
//  Created by Art on 30.09.2021.
//

import UIKit

class ViewController: UIViewController {

//MARK: - Outlets
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var countTapsLabel: UILabel!
    @IBOutlet private var buttonCollection: [UIButton]!
    
//MARK: - Properties
    
    private lazy var game = LogicConcentration(numberOfPairs: (buttonCollection.count + 1) / 2)
    private var emojiCollection = ["🚌", "🎲", "🎽", "🌺", "🐒", "🐝", "🦁", "🌒", "❄️", "🍓", "🧊", "🛹", "🎰", "🚀", "🌋"]
    private var emojiDictionary = [Int: String]()
    private var touches = 0 {
        didSet {
            countTapsLabel.text = "Количество нажатий \(touches)"
        }
    }
    
//MARK: - Action
    
    @IBAction private func buttoAction(_ sender: UIButton) {
        touches += 1
        guard let buttonIndex = buttonCollection.firstIndex(of: sender) else { return }
        game.chooseCard(at: buttonIndex)
        updateViewFromModel()
    }
    
//MARK: - functions
    //задаем текст и цвет кнопок
    private func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.tintColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.tintColor = .green
                if card.isMatched {
                    button.isHidden = true
                }
            }
        }
    }
    
    //выбираем эмоджи
    private func emojiIdentifier(for card: ModelCard) -> String {
        //проверяем есть ли такая в словаре
        if emojiDictionary[card.identifier] == nil {
            //берем рандомный индекс из коллекции
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            //удаляем и добавляем эмоджи по ключу в словарь
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
}

