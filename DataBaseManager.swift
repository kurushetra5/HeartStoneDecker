//
//  DataBaseManager.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 12/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//


import Cocoa


class DataBaseManager {
    
    var applicationDelegate = NSApplication.shared.delegate  as? AppDelegate
    let managedContext:NSManagedObjectContext!
    
    var selectedCosts:[String] = []
    var selectedHeros:[String] = []
    var selectedTypes:[String] = []
    var selectedKeys:[String] = []
    
    
    init() {
        managedContext =  applicationDelegate?.persistentContainer.viewContext
        
    }
    
    
    func newCard(fromDict: Dictionary<String, String>) {
        
        let newCard = newDBCard()
        newCard.name = fromDict["Name"]
        newCard.atack = fromDict["Attack"]
        newCard.cost = fromDict["Cost"]
        newCard.health = fromDict["Health"]
        newCard.theClass = fromDict["Class"]
        newCard.type = fromDict["Type"]
        newCard.imageLink = "NO"
        newCard.webImageLink = "NO"
        saveDataBase()
        print(newCard)
        
    }
    
    
    
    
    public func filterCards(filterType:CheckType, buttonState:Int, checkTag:Int) -> [DBCard] {
        
        var predicate:NSPredicate!
        var value:String!
        
        
        switch filterType {
            
        case .cardType:
            
            if checkTag == CardTypes.echizos.rawValue {
                value = "Hechizo "
            }
            if checkTag == CardTypes.armas.rawValue {
                value = "Arma "
            }
            if checkTag == CardTypes.criaturas.rawValue {
                value = "Criatura "
            }
            
            if buttonState == 1 {
               selectedKeys.append("type")
               selectedTypes.append(value)
            }else if buttonState == 0 {
                selectedKeys.remove(at:selectedKeys.index(of:"type")!)
                 selectedTypes.remove(at:selectedTypes.index(of:value)!)
            }
        
        case .hero:
            
            if checkTag == HerosNames.mago.rawValue {
                value = "Mago "
            }
            if checkTag == HerosNames.guerrero.rawValue {
                value = "Guerrero "
            }
            
            if buttonState == 1 {
                selectedKeys.append("theClass")
                selectedHeros.append(value)
                
            }else if buttonState == 0 {
                selectedKeys.remove(at:selectedKeys.index(of:"theClass")!)
                selectedHeros.remove(at:selectedHeros.index(of:value)!)
            }
           
        case .cost:
             value = "\(checkTag) "
            
            if buttonState == 1 {
                selectedKeys.append("cost")
                selectedCosts.append(value)
            }else if buttonState == 0 {
                 selectedKeys.remove(at:selectedKeys.index(of:"cost")!)
                 selectedCosts.remove(at:selectedCosts.index(of:value)!)
            }
            
        }
 
        predicate = NSPredicate(format:"cost IN %@ AND theClass IN %@ AND type IN %@",selectedCosts,selectedHeros,selectedTypes)
        return fetchCardBy(predicate:predicate)
    }
    
    
    
    
    public  func cleanDataBase() {
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName:"DBCard")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            try managedContext.execute(request)
            
        } catch {
            // Error Handling
        }
        
    }
    
    
    
    
    func saveDataBase() {
        do {
            try self.managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    
    
    
    
    private func fetchCardBy(predicate:NSPredicate) ->  [DBCard]! { //FIXME: Sobra ip
        
        var foundedCards:[DBCard]!
        
        let fetchRequest: NSFetchRequest<DBCard> = DBCard.fetchRequest()
        fetchRequest.predicate = predicate
        
        do {
            let searchResults = try managedContext.fetch(fetchRequest)
            print ("num of results = \(searchResults.count)")
            foundedCards = searchResults
            
        } catch {
            print("Error with request: \(error)")
        }
        return  foundedCards
    }
    
    
    
    
    
    
    
    
    public func cardsDataBase() -> [DBCard] {
        
        var cards:[DBCard] = []
        
        let fetchRequest: NSFetchRequest<DBCard> = DBCard.fetchRequest()
        
        do {
            let searchResults = try managedContext.fetch(fetchRequest)
            //            print ("num of results = \(searchResults.count)")
            
            for card in searchResults as [DBCard] {
                cards.append(card)
                //                print("\(String(describing: ip.value(forKey: "number")))")
            }
            
        } catch {
            print("Error with request: \(error)")
        }
        return cards
    }
    
    
    
    
    
    
    func  newDBCard() -> DBCard {
        let entity = NSEntityDescription.entity(forEntityName: "DBCard", in: self.managedContext)!
        let newDBCard = NSManagedObject(entity: entity,insertInto: self.managedContext) as! DBCard
        return newDBCard
    }
    
}
