//
//  HerosManager.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 15/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation


struct HerosManager {
    
    var heros:[Hero] = []
    
    
    mutating func newDeck(forHero:HeroTypes) {
        let hero = Hero(withType:forHero)
        heros.append(hero)
    }
    
    
    
}
