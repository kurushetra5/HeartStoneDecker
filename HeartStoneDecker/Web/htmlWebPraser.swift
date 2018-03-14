//
//  htmlWebPraser.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 11/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Cocoa



class htmlWebPraser  {

    var pagesIndexes:String! //computed para limpiarla
    var lastUpdateVersion:String!
    var startCardsIndex = 9
    var lastCardsIndex = 308
    
    
    
    
    func parseWeb2(data:String,webIndex:String, completion:([Dictionary<String,String>]) -> Void) {
        
        
        var cardImageLink:String!
        var cardName:String!
        
        var singleCard:Dictionary<String,String> = [:]
        var arrayCards:Dictionary<String,Dictionary<String,String>> = [:]
        
        var arrayData = data.components(separatedBy:"imagen_carta")
 
        
        for line in 1..<26  {
            var arrayData2 = arrayData[line].components(separatedBy:"src=")
            var arrayData3 = arrayData2[1].components(separatedBy:"alt")
            
            print(arrayData3[0])
            cardImageLink = arrayData3[0]
            
            var arrayData4 = arrayData3[1].components(separatedBy:"\u{22}")
            print(arrayData4[1])
            cardName = arrayData4[1]
            
            singleCard["Name"] = cardName
            singleCard["imageLink"] = cardImageLink
            arrayCards[cardName] = singleCard
        }
        
        let arrayCardsNSDict = arrayCards as NSDictionary
        arrayCardsNSDict.write(toFile:"/Users/kurushetra/Developer/HeartStoneDecker/HeartStoneDecker/Images_Downloaded/CardsImages_" + webIndex + ".plist", atomically: true)
    }
    
    
    
    
    
    
    func parseWeb(data:String,webIndex:String, completion:(Dictionary<String,String>) -> Void) {
        
        var cartTilte:String = ""
        var cartName:String = ""
        var cartType:String = ""
        var cartClass:String = ""
        var cartAttack:String = ""
        var cartHealth:String = ""
        var cartCost:String = ""
        var singleCard:Dictionary<String,String> = [:]
        var arrayCards:Dictionary<String,Dictionary<String,String>> = [:]
        
        
        var arrayData = data.components(separatedBy:"Lista Visual")
        var arrayData2 = arrayData[1].components(separatedBy:"ÚLTIMOS MAZOS")
        var lines = arrayData2[0].components(separatedBy:"\n")
        
        pagesIndexes = lines[1]
//        lastUpdateVersion = lines[310]
        
        
        var sumName = 0
        
        for _ in 0..<50  {
            cartName = lines[9+sumName]
            cartType = lines[9+sumName+1]
            cartClass = lines[9+sumName+2]
            cartCost = lines[9+sumName+3]
            cartAttack = lines[9+sumName+4]
            cartHealth = lines[9+sumName+5]
            cartTilte = "Card_" + cartName
            
            let attackClean:String = String(cartAttack.dropLast())
//            let healthClean:String = String(cartHealth.dropLast())
            let cartCostClean:String = String(cartCost.dropLast())
            
            
            singleCard["Name"] = cartName
            singleCard["Type"] = cartType
            singleCard["Class"] = cartClass
            singleCard["Cost"] = cartCostClean
            singleCard["Attack"] = attackClean
            singleCard["Health"] = cartHealth
            arrayCards[cartTilte] = singleCard
            
            completion(singleCard)
//            print("-------------")
//            print(line)
//            print(lines[9+sumName])
//            print(lines[9+sumName+1])
//            print(lines[9+sumName+2])
//            print(lines[9+sumName+3])
//            print(lines[9+sumName+4])
//            print(lines[9+sumName+5])
//            print("-------------")
            sumName += 6
            
        }
        
//        let arrayCardsNSDict = arrayCards as NSDictionary
//        arrayCardsNSDict.write(toFile:"/Users/kurushetra/Developer/HeartStoneDecker/HeartStoneDecker/Images_Downloaded/Cards_" + webIndex + ".plist", atomically: true)
        
        
        
        
 
    }
    
    
    
    
 
    
    
    
}
