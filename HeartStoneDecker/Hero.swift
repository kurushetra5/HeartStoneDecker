//
//  Hero.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 15/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation



struct Hero {
    
    var decks:[Deck]!
    var heroType: HeroTypes!
    var heroName:HeroNames!
    
    init(withType:HeroTypes) {
        self.heroType = withType
        self.heroName =  self.heroType.stringName()
    }
    
    public mutating func add(deck:Deck) {
        if !decks.contains(deck) {
            decks.append(deck)
        }
        
    }
    
    public mutating func remove(deck:Deck) {
        if decks.contains(deck) {
            decks.remove(at:decks.index(of:deck)!)
        }
    }
    
}
