//
//  ModelCard.swift.swift
//  Concentration
//
//  Created by Art on 30.09.2021.
//

import Foundation

struct ModelCard {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = ModelCard.identifierGenerator()
    }
}
