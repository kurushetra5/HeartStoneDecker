//
//  Deck.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 15/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation



struct  Deck:Hashable  {
    
    let cardsNumber:Int = 30
    var cards:[DBCards] = []
    var owner: HeroTypes!
    var deckCompleted:Bool = false
    
    
    
    
    var remainingCards:Int {
        return cardsNumber - cards.count
    }
    
    var deckAttackPoints:Int {
        var attack:Int = 0
        for  card in cards {
            attack +=  card.atack.hashValue
        }
        return attack
    }
    
    var deckHealthPoints:Int {
        var health:Int = 0
        for  card in cards {
            health +=  card.health.hashValue
        }
        return health
        
    }
    
    
    
    var hashValue: Int
    
    static func ==(lhs: Deck, rhs: Deck) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    
    
    
    mutating func add(card:DBCards) {
        if !cards.contains(card) {
            cards.append(card)
        }
        
    }
    mutating func remove(card:DBCards) {
        if cards.contains(card) {
            cards.remove(at:cards.index(of:card)!)
        }
    }
    
    func checkIfValid(card:DBCards) -> Bool { //TODO: puede que no sirva
        
        return true
    }
    
    
    func numberOfCards(type:CardStringType) -> Int {
        var resultNumber:Int = 0
        
        for card in  cards {
            if card.type == type.rawValue {
                resultNumber += 1
            }
        }
        
        return resultNumber
    }
    
    
}
