//
//  AppController.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 10/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation
import Cocoa

protocol CardsUpdaterDelegate {
    func cardsAreUpdated(newCards:[DBCards])
}

protocol SetDelegateForNewDeckController {
    func setDelegateForNewDeckVC() -> NewDeckVCDataDelegate
}



class AppController:WebDownloaderDelegate {
    
    
    static let shared  = AppController()
    var webDownloader  = WebDownloader()
    var webDownloader2  = webDownloaderPage2()
    var imagesDownloader  = ImagesDownloader()
    var dataBase  = DataBaseManager()
    var herosManager:HerosManager = HerosManager()
    
    
    
    var cardsUpdaterDelegate:CardsUpdaterDelegate!
    var delegateForNewDeckController:SetDelegateForNewDeckController!
    
    
    private init() {
        webDownloader.webDownloaderDelegate = self
        
//        var cardChosser:CardsChosser =  CardsChosser()
//        let bestCostAttack:[DBCards] = cardChosser.chosseCards(amount:2, cards:dataBase.cardsDataBase(), quality:.costAttack)
//        let bestCostHealth:[DBCards] = cardChosser.chosseCards(amount:2, cards:dataBase.cardsDataBase(), quality:.costHealth)
//        let bestAttackHealth:[DBCards] = cardChosser.chosseCards(amount:2, cards:dataBase.cardsDataBase(), quality:.attackHealth)
//        
//         print("bestCostAttack--------------------")
//        print(bestCostAttack)
//         print("bestCostHealth--------------------")
//        print(bestCostHealth)
//        print("bestAttackHealth--------------------")
//        print(bestAttackHealth)
    }
    
    
    //MARK: ------------- Public Funcs   -------------
    /// downloads
    public func downloadWebs() {
                 webDownloader.startDownloadCards()
        //        webDownloader2.startDownloadCards()
    }
    
    public func downloadImages() {
        imagesDownloader.downloadImages()
    }
    
    /// database
    public func cardsFromDataBase() -> [DBCards] {
        return dataBase.cardsDataBase()
    }
    
    public func filterCards(filterType:CheckType, buttonState:Int, checkTag:Int) {
        let cards:[DBCards] = dataBase.filterCards(filterType:filterType, buttonState:buttonState, checkTag:checkTag)
        cardsUpdaterDelegate?.cardsAreUpdated(newCards:cards)
    }
    
    public func fetchCards() {
        cardsUpdaterDelegate?.cardsAreUpdated(newCards:dataBase.fetchCard())
    }
    
    
    ///decks
    public func newDeck(forHero:HeroTypes) {
         herosManager.newDeck(forHero:forHero)
    }
    
    func getDelegateForNewDeckVC() -> NewDeckVCDataDelegate {
        return delegateForNewDeckController?.setDelegateForNewDeckVC as! NewDeckVCDataDelegate
        
    }
    
    //MARK: ------------- WebDownloaderDelegate  -------------
    func newDownloaded(card: Dictionary<String, String>) {
        dataBase.newCard(fromDict:card)
    }
    
    
    
}
