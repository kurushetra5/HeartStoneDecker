//
//  CardObjectMaker.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 11/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Cocoa


struct  CardFromPraser:Codable {
    var deckType:String   //kobol,classic,...
    var deckClass:String  //classic,salvage
    var name:String
    var Info:String
    var hero:String       //mage,druida,All,...
    var cost:Int
    var attackPoints:Int
    var healthPoints:Int
    var provoker:Bool
    var provokeGiver:Bool
    var attacker:Bool
    var curer:Bool
    var armadurePicker:Bool
    var increaserAttack:Bool
    var cardsPicker:Bool
    var cardsDroper:Bool
    var painMaker:Bool
    var selfPainMaker:Bool
    var type:String      //epic,usual,rare,legendary
}




class CardObjectMaker  {
    
    
    
    func makeObjectFrom(webCardInfo:String) {
        
        if let url = Bundle.main.url(forResource: webCardInfo, withExtension: "plist"),
            let data = try? Data(contentsOf: url) {
            let decoder = PropertyListDecoder()
            
            do {
                let card = try decoder.decode(CardFromPraser.self, from: data)
                OperationQueue.main.addOperation({
                    //self.locatorDelegate.ipLocationReady(ipLocation:node)
                })
                
            } catch let error as NSError {
                print(error)
            }
        }
    }
    
    
    
    
    
    
    
}
