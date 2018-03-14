//
//  Deck.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 15/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation



struct  Deck {
    static let cardsNumber:Int = 30
    var cards:[DBCards] = []
    var owner:HerosNames!
    
    
    
    init(forAvatar:HerosNames) {
        self.owner = forAvatar
    }
    
    func add(card:DBCards) {
        
    }
    func remove(card:DBCards) {
        
    }
    
    func checkIfValid(card:DBCards) -> Bool {
        
        return true
    }
    
}
