//
//  ModelCard.swift.swift
//  Concentration
//
//  Created by Art on 30.09.2021.
//

import Foundation

struct ModelCard: Hashable {
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    private static var identifierNumber = 0
    
    private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    //делаем возможным сравнивание внутри структуры
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func ==(lhs: ModelCard, rhs: ModelCard) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    init() {
        self.identifier = ModelCard.identifierGenerator()
    }
}
