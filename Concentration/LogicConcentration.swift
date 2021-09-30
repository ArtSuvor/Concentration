//
//  LogicConcentration.swift
//  Concentration
//
//  Created by Art on 30.09.2021.
//

import Foundation

class LogicConcentration {
    
    var cards = [ModelCard]()
    var indexOfOneOnlyFaceUpCard: Int?
    
//MARK: - Логика переворачивания карточек
    
    func chooseCard(at index: Int) {
        //если нажатая не является совпавшей, то
        if !cards[index].isMatched {
            //есть ли уже одна единственная перевернутая
            if let matchingIndex = indexOfOneOnlyFaceUpCard,
               //и нажимаем ли мы на нее еще раз, то
               matchingIndex != index {
                //если да, проверяем совпали ли карточки
                if cards[matchingIndex].identifier == cards[index].identifier {
                    //если да, говорим что совпали
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                //если нет, переворачиваем карточку и обнуляем индекс единственно перевернутой
                cards[index].isFaceUp = true
                indexOfOneOnlyFaceUpCard = nil
            //если это первая перевернутая карточка
            } else {
                //переворачиваем все карточки в массиве
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                //говорим что карточка перевернута и что она единственная перевернута
                cards[index].isFaceUp = true
                indexOfOneOnlyFaceUpCard = index
            }
        }
    }
    
//MARK: - Добавляем карточки в массив при инициализации
    
    init(numberOfPairs: Int) {
        for _ in 1...numberOfPairs {
            let card = ModelCard()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
