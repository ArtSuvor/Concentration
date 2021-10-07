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
    
    private lazy var game = LogicConcentration(numberOfPairs: numberOfPairs)
    private var numberOfPairs: Int {
        (buttonCollection.count + 1) / 2
    }
    
    private var emojiCollection = ["🚌", "🎲", "🎽", "🌺", "🐒", "🐝", "🦁", "🌒", "❄️", "🍓", "🧊", "🛹", "🎰", "🚀", "🌋"]
    private var emojiDictionary = [ModelCard: String]()
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
                    button.layer.opacity = 0
                }
            }
        }
    }
    
    //выбираем эмоджи
    private func emojiIdentifier(for card: ModelCard) -> String {
        //проверяем есть ли такая в словаре
        if emojiDictionary[card] == nil {
            //берем рандомный индекс из коллекции
            //удаляем и добавляем эмоджи по ключу в словарь
            emojiDictionary[card] = emojiCollection.remove(at: emojiCollection.count.arc4randomExtension)
        }
        return emojiDictionary[card] ?? "?"
    }
}

//MARK: - Extension

extension Int {
    var arc4randomExtension: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        return 0
    }
}
