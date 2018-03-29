//
//  Enums.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 13/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation

enum CardQuality:Int {
    case costAttack,costHealth,attackHealth
}


enum CheckType:Int {
    case cost,hero,cardType
}

enum CardTypes:Int {
    case echizos,criaturas,armas,heroe
}
enum CardStringType:String {
    case echizos,criaturas,armas,heroe
}

enum  HeroTypes:Int {
    case mago,guerrero,cazador,druida,picaro,brujo,sacerdote,paladin,chaman,neutral
    
    func stringName() -> HeroNames {
        var result:HeroNames!
        
        switch self {
        case .mago:
            result = .mago
        case .guerrero:
            result = .guerrero
        case .cazador:
            result = .cazador
        case .druida:
            result = .druida
        case .picaro:
            result = .picaro
        case .brujo:
            result = .brujo
        case .sacerdote:
            result = .sacerdote
        case .paladin:
            result = .paladin
        case .chaman:
            result = .chaman
        case .neutral:
            result = .neutral
        }
        return result
     }
}


enum  HeroNames:String {
    case mago,guerrero,cazador,druida,picaro,brujo,sacerdote,paladin,chaman,neutral
}
