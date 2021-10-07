//
//  LogicConcentration.swift
//  Concentration
//
//  Created by Art on 30.09.2021.
//

import Foundation

class LogicConcentration {
    
    private(set) var cards = [ModelCard]()
    private var indexOfOneOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            //смотрим по всем, есть ли перевернутые
            for index in cards.indices {
                if cards[index].isFaceUp {
                    //если да, смотрим есть ли одна единственная перевернутая
                    if foundIndex == nil {
                        //если нет перевернутых, то
                        foundIndex = index
                    } else {
                        //если есть, то обнуляем их
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            //смотрим по всем карточкам, есть ли перевернутые
            for index in cards.indices {
                //устанавливаем true or false
                cards[index].isFaceUp = (index == newValue) 
            }
        }
    }
    
//MARK: - Логика переворачивания карточек
    
    func chooseCard(at index: Int) {
        //если нажатая не является совпавшей, то
        if !cards[index].isMatched {
            //есть ли уже одна единственная перевернутая
            if let matchingIndex = indexOfOneOnlyFaceUpCard,
               //и нажимаем ли мы на нее еще раз, то
               matchingIndex != index {
                //если да, проверяем совпали ли карточки(метод сравнения описан в модели)
                if cards[matchingIndex] == cards[index] {
                    //если да, говорим что совпали
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                //если нет, переворачиваем карточку
                cards[index].isFaceUp = true
            //если это первая перевернутая карточка
            } else {
                //говорим что она единственная перевернута
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
