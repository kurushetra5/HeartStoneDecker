//
//  ViewController.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 10/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Cocoa


class ViewController: NSViewController, CardsUpdaterDelegate  {
    
    @IBOutlet weak var backgroundView: NSImageView!
    @IBOutlet weak var tableViewCards: NSTableView!
    
    
    
    @IBAction func costCheck(_ sender: NSButton) {
        
        switchOpacity(sender:sender)
        appController.filterCards(filterType:.cost, buttonState:sender.state.rawValue, checkTag:sender.tag)
    }
    @IBAction func  theClassCheck(_ sender: NSButton) {
        switchOpacity(sender:sender)
        appController.filterCards(filterType:.cardType, buttonState:sender.state.rawValue, checkTag:sender.tag)
        
    }
    @IBAction func avatarCheck(_ sender: NSButton) {
        switchOpacity(sender:sender)
        appController.filterCards(filterType:.hero, buttonState:sender.state.rawValue, checkTag:sender.tag)
    }
    
    
    
    var appController:AppController = AppController.shared
    var dataBaseCards:[DBCard] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
    }
    
    
    override func viewDidAppear() {
        super.viewDidAppear()
        appController.cardsUpdaterDelegate = self
        self.dataBaseCards = appController.cardsFromDataBase()
        tableViewCards.reloadData()
    }
    
    
    
    func viewConfiguration() {
        if self.view.layer != nil {
            self.view.layer?.backgroundColor = .black
            backgroundView.wantsLayer = true
            backgroundView.layer?.opacity = 0.1
            
        }
    }
    
    private func switchOpacity(sender:NSButton) {
        
        if sender.state.rawValue == 0 {
            switchOpacityOff(button:sender)
        }else {
            switchOpacityOn(button:sender)
        }
    }
    
    private func switchOpacityOff(button:NSButton) {
        button.layer?.opacity = 0.5
    }
    private func switchOpacityOn(button:NSButton) {
        button.layer?.opacity = 1.0
    }
    
    
    
    //MARK: ------------- CardsUpdaterDelegate  -------------
    func cardsAreUpdated(newCards: [DBCard]) {
        self.dataBaseCards = newCards
        tableViewCards.reloadData()
    }
    
}








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
        result.cardImage.image = #imageLiteral(resourceName: "imagen")
        return result
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        let selelectedRow = tableViewCards.selectedRow
        let selectedView = tableViewCards.rowView(atRow:selelectedRow, makeIfNecessary:false)
        selectedView?.selectionHighlightStyle = .none
        //        selectedView?.isEmphasized = false
        
    }
    
}




