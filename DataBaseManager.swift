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
    
    var selectedCosts:[String]!
    var selectedHeros:[String]!
    var selectedTypes:[String]!
    var selectedKeys:[String]!
    
    
    init() {
        managedContext =  applicationDelegate?.persistentContainer.viewContext
      resetFilters()
    }
    
    func resetFilters() {
        selectedCosts  = ["0","1","2","3","4","5","6","7","8","9","10"]
        selectedHeros  = ["Mago ","Guerrero ","Brujo ","Paladín ","Cazador ","Sacerdote ","Pícaro ","Chamán ","Druida ","Neutral "]
        selectedTypes  = ["Hechizo ","Arma ","Criatura ","Heroe "]
        selectedKeys   = ["type","theClass","cost"]
    }
    
//    func sortCardsBy(buttonTag:Int) {
//        
//        switch  buttonTag {
//        case 0:
//            print("0")
//        case 1:
//            print("1")
//        case 2:
//            print("2")
//        default:
//            print("Error.. sortCardsBy(buttonTag:Int)")
//        }
//    }
    
    func newCard(fromDict: Dictionary<String, String>) {
        
        let newCard = newDBCards()
        newCard.name = fromDict["Name"]
        newCard.atack = Int32(Int(fromDict["Attack"]!)!)
        newCard.cost = Int32(Int(fromDict["Cost"]!)!)
        newCard.health = Int32(Int(fromDict["Health"]!)!)
        newCard.theClass = fromDict["Class"]
        newCard.type = fromDict["Type"]
        newCard.imageLink = "NO"
        newCard.webImageLink = "NO"
        saveDataBase()
        print(newCard)
        
    }
    
    
    
    
    public func filterCards(filterType:CheckType, buttonState:Int, checkTag:Int) -> [DBCards] {
        
 
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
            if checkTag == CardTypes.heroe.rawValue {
                value = "Heroe "
            }
            if buttonState == 1 {
                if !selectedKeys.contains("type") {
                    selectedKeys.append("type")
                }
                if !selectedTypes.contains(value) {
                    selectedTypes.append(value)
                }
                
            } else if buttonState == 0 {
                
                if selectedKeys.contains("type") {
                   selectedKeys.remove(at:selectedKeys.index(of:"type")!)
                }
                if selectedTypes.contains(value) {
                   selectedTypes.remove(at:selectedTypes.index(of:value)!)
                }
            }
        
        case .hero:
            
            if checkTag == HerosNames.mago.rawValue {
                value = "Mago "
            }
            if checkTag == HerosNames.guerrero.rawValue {
                value = "Guerrero "
            }
            if checkTag == HerosNames.brujo.rawValue {
                value = "Brujo "
            }
            if checkTag == HerosNames.paladin.rawValue {
                value = "Paladín "
            }
            if checkTag == HerosNames.cazador.rawValue {
                value = "Cazador "
            }
            if checkTag == HerosNames.sacerdote.rawValue {
                value = "Sacerdote "
            }
            if checkTag == HerosNames.picaro.rawValue {
                value = "Pícaro "
            }
            if checkTag == HerosNames.chaman.rawValue {
                value = "Chamán "
            }
            if checkTag == HerosNames.druida.rawValue {
                value = "Druida "
            }
            if checkTag == HerosNames.neutral.rawValue {
                value = "Neutral "
            }
            
            if buttonState == 1 {
                
                if !selectedKeys.contains("theClass") {
                    selectedKeys.append("theClass")
                }
                if !selectedHeros.contains(value) {
                    selectedHeros.append(value)
                }
            } else if buttonState == 0 {
                
                if selectedKeys.contains("theClass") {
                    selectedKeys.remove(at:selectedKeys.index(of:"theClass")!)
                }
                if selectedHeros.contains(value) {
                   selectedHeros.remove(at:selectedHeros.index(of:value)!)
                }
                
                
                
            }
           
        case .cost:
             value = "\(checkTag)"
            
            if buttonState == 1 {
                if !selectedKeys.contains("cost") {
                    selectedKeys.append("cost")
                }
                if !selectedCosts.contains(value) {
                    selectedCosts.append(value)
                }
                
            }else if buttonState == 0 {
                
                if selectedKeys.contains("cost") {
                    selectedKeys.remove(at:selectedKeys.index(of:"cost")!)
                }
                if selectedCosts.contains(value) {
                    selectedCosts.remove(at:selectedCosts.index(of:value)!)
                }
            }
        }
 
        
        return fetchCard()
    }
    
    
    
    
    public  func cleanDataBase() {
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName:"DBCards")
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
    
    
    
    
    
    
      func fetchCard() ->  [DBCards]! {
        
        var foundedCards:[DBCards]!
        var predicate:NSPredicate!
        predicate = NSPredicate(format:"cost IN %@ AND theClass IN %@ AND type IN %@",selectedCosts,selectedHeros,selectedTypes)
        
        let fetchRequest: NSFetchRequest<DBCards> = DBCards.fetchRequest()
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
    
    
    
    
    
    
    
    
    public func cardsDataBase() -> [DBCards] {
        
        var cards:[DBCards] = []
        
        let fetchRequest: NSFetchRequest<DBCards> = DBCards.fetchRequest()
        
        do {
            let searchResults = try managedContext.fetch(fetchRequest)
            //            print ("num of results = \(searchResults.count)")
            
            for card in searchResults as [DBCards] {
                cards.append(card)
                //                print("\(String(describing: ip.value(forKey: "number")))")
            }
            
        } catch {
            print("Error with request: \(error)")
        }
        return cards
    }
    
    
    
    
    
    
    func  newDBCards() -> DBCards {
        let entity = NSEntityDescription.entity(forEntityName: "DBCards", in: self.managedContext)!
        let newDBCards = NSManagedObject(entity: entity,insertInto: self.managedContext) as! DBCards
        return newDBCards
    }
    
}
