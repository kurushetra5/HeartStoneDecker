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
    func cardsAreUpdated(newCards:[DBCard])
}



class AppController:WebDownloaderDelegate {
    
    
    static let shared  = AppController()
    var webDownloader  = WebDownloader()
    var webDownloader2  = webDownloaderPage2()
    var imagesDownloader  = ImagesDownloader()
    var dataBase  = DataBaseManager()
    var cardsUpdaterDelegate:CardsUpdaterDelegate!
    
    
    private init() {
        webDownloader.webDownloaderDelegate = self
    }
    
    
    //MARK: ------------- Public Funcs   -------------
    /// downloads
    public func downloadWebs() {
        //        webDownloader.startDownloadCards()
        //        webDownloader2.startDownloadCards()
    }
    
    public func downloadImages() {
        imagesDownloader.downloadImages()
    }
    
    /// database
    public func cardsFromDataBase() -> [DBCard] {
        return dataBase.cardsDataBase()
    }
    
    public func filterCards(filterType:CheckType, buttonState:Int, checkTag:Int) {
        let cards:[DBCard] = dataBase.filterCards(filterType:filterType, buttonState:buttonState, checkTag:checkTag)
        cardsUpdaterDelegate?.cardsAreUpdated(newCards:cards)
    }
    
    public func fetchCards() {
        cardsUpdaterDelegate?.cardsAreUpdated(newCards:dataBase.fetchCard())
    }
//    public func sortCardsBy(buttonTag:Int) {
//        dataBase.sortCardsBy(buttonTag:buttonTag)
//    }
    
    
    //MARK: ------------- WebDownloaderDelegate  -------------
    func newDownloaded(card: Dictionary<String, String>) {
        dataBase.newCard(fromDict:card)
    }
    
    
    
}
