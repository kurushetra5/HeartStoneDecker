//
//  ViewController.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 10/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Cocoa


class ViewController: NSViewController, CardsUpdaterDelegate  {
    
//    MARK: ------------- Buttons  -------------
//    @IBOutlet weak var cost1: NSButton!
//    @IBOutlet weak var cost2: NSButton!
//    @IBOutlet weak var cost3: NSButton!
//    @IBOutlet weak var cost4: NSButton!
//    @IBOutlet weak var cost5: NSButton!
//    @IBOutlet weak var cost6: NSButton!
//    @IBOutlet weak var cost7: NSButton!
//    @IBOutlet weak var cost8: NSButton!
//    @IBOutlet weak var cost9: NSButton!
//    @IBOutlet weak var cost10: NSButton!
    
    
    
    //MARK: ------------- OUTLETS  -------------
    @IBOutlet weak var backgroundView: NSImageView!
    @IBOutlet weak var tableViewCards: NSTableView!
    
    
    
    //MARK: ------------- ACTIONS  -------------
    @IBAction func costCheck(_ sender: NSButton) {
        sender.switchOpacity()
        appController.filterCards(filterType:.cost, buttonState:sender.state.rawValue, checkTag:sender.tag)
    }
    @IBAction func  theClassCheck(_ sender: NSButton) {
        sender.switchOpacity()
        appController.filterCards(filterType:.cardType, buttonState:sender.state.rawValue, checkTag:sender.tag)
    }
    @IBAction func avatarCheck(_ sender: NSButton) {
        sender.switchOpacity()
        appController.filterCards(filterType:.hero, buttonState:sender.state.rawValue, checkTag:sender.tag)
    }
    @IBAction func showAllCards(_ sender: Any) {
      self.dataBaseCards =  appController.cardsFromDataBase()
        tableViewCards.reloadData()
    }
    @IBAction func sortCardsBy(_ sender: NSButton) {
        
        var storedBy:[DBCard] = dataBaseCards.sorted(by:{$0.name! < $1.name!})
        
        switch sender.tag {
        case 0:
            storedBy = dataBaseCards.sorted(by:{$0.cost! < $1.cost!})
        case 1:
               storedBy = dataBaseCards.sorted(by:{$0.atack! < $1.atack!})
        case 2:
              storedBy = dataBaseCards.sorted(by:{$0.health! < $1.health!})
//        case 3:
//              storedBy = dataBaseCards.sorted(by:{$0.name! < $1.name!})
         default:
            print("Default de sortCardsBy(_ sender: NSButton)")
        }
 
        dataBaseCards = storedBy
        tableViewCards.reloadData()
//        appController.sortCardsBy(buttonTag:sender.tag)
    }
    
    
    
    //MARK: ------------- CLASS VARS  -------------
    var appController:AppController = AppController.shared
    var dataBaseCards:[DBCard] = []
    
    
    //MARK: ------------- LIFE CIRCLE  -------------
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
    }
    
    
    override func viewDidAppear() {
        super.viewDidAppear()
        appController.cardsUpdaterDelegate = self
//        appController.fetchCards()
//        tableViewCards.reloadData()
    }
    
    //MARK: ------------- VIEW CONFIG  -------------
    func viewConfiguration() {
        if self.view.layer != nil {
            self.view.layer?.backgroundColor = .black
            backgroundView.wantsLayer = true
            backgroundView.layer?.opacity = 0.180
        }
    }
    
    //MARK: ------------- CARDS UPDATE DELEGATE -------------
    func cardsAreUpdated(newCards: [DBCard]) {
        self.dataBaseCards = newCards
        tableViewCards.reloadData()
    }
    
}



//MARK: ------------- EXTENSION TABLEVIEW -------------
extension ViewController: NSTableViewDelegate,NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.dataBaseCards.count
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let result:CardsTableViewCell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "defaultRow"), owner: self) as! CardsTableViewCell
        
        result.CardNameText.stringValue = self.dataBaseCards[row].name!
        result.cost.stringValue = self.dataBaseCards[row].cost!
        result.attack.stringValue = self.dataBaseCards[row].atack!
        result.health.stringValue = self.dataBaseCards[row].health!
        result.theClass.stringValue = self.dataBaseCards[row].theClass!
        result.type.stringValue = self.dataBaseCards[row].type!
        result.chosseImage()
//        result.cardImage.image = #imageLiteral(resourceName: "imagen")
        return result
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        let selelectedRow = tableViewCards.selectedRow
        let selectedView = tableViewCards.rowView(atRow:selelectedRow, makeIfNecessary:false)
        selectedView?.selectionHighlightStyle = .none
        //        selectedView?.isEmphasized = false
        
    }
    
}




