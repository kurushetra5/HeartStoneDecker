//
//  CardsChosser.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 15/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//



import Foundation

struct Card:Equatable {
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.name == rhs.name
    }
    var name:String!
    var attack:Int32!
    var cost:Int32!
    var health:Int32!
}



struct  CardsChosser {
    
   private var  cartsToChosse:[Card] = []
    
    
   public mutating func chosseCards(amount:Int, cards:[DBCards], quality:CardQuality) -> [DBCards] {
        
        cartsToChosse = convertDBCartToCard(cards: cards)
        var chossen:[Card] = []
        var resultCards:[DBCards] = []
        var card:Card!
        
        for _ in 0..<amount {
            
            if quality == .costAttack {
                card = choseBestCostAttack(inCards:cartsToChosse)
            }
            if quality == .costHealth {
                card = choseBestCostHealth(inCards:cartsToChosse)
            }
            if quality == .attackHealth {
                card = choseBestAttackHealth(inCards:cartsToChosse)
            }
            chossen.append(card)
            cartsToChosse.remove(at:cartsToChosse.index(of:card)!)
        }
        
        for card in chossen {
            
            for dbCard in cards {
                if dbCard.name == card.name {
                    resultCards.append(dbCard)
                }
            }
            
        }
        return resultCards
    }
    
    
    
    
    
    
   private func convertDBCartToCard(cards:[DBCards]) -> [Card] {
        
        var  resultCards:[Card] = []
        
        for card in  cards {
            let newCard:Card = Card(name:card.name, attack:card.atack, cost:card.cost, health: card.health)
            resultCards.append(newCard)
        }
        return resultCards
    }
    
    
    
    
    
  private  func choseBestCostAttack(inCards:[Card]) ->  Card {
        
        var cardResult:Card!
        let sorted = inCards.sorted(by:{$0.cost > $1.cost})
        var counter:Int = 0
        
        for card in sorted {
            if card.attack > inCards[counter].attack {
                cardResult = card
            }
            if counter <= 1298 {
                counter += 1
            }
        }
        return cardResult
    }
    
    
    
    
    
  private  func choseBestCostHealth(inCards:[Card]) -> Card {
        
        var cardResult:Card!
        let sorted = inCards.sorted(by:{$0.cost > $1.cost})
        var counter:Int = 0
        
        for card in sorted {
            if card.health > inCards[counter].health {
                cardResult = card
            }
            if counter <= 1298 {
                counter += 1
            }
        }
        return cardResult
    }
    
    
    
  private  func choseBestAttackHealth(inCards:[Card]) -> Card {
        
        var cardResult:Card!
        let sorted = inCards.sorted(by:{$0.attack < $1.attack})
        var counter:Int = 0
        
        for card in sorted {
            if card.health > inCards[counter].health {
                cardResult = card
            }
            if counter <= 1298 {
                counter += 1
            }
        }
        return cardResult
    }
    
    
    
    
    
    
}
