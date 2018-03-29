//
//  NewDeckVC.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 15/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Cocoa

protocol NewDeckVCDataDelegate {
    func hero(name:String)
    func deck(cards:Int)
}



class NewDeckVC: NSViewController {

    @IBOutlet weak var chosseButton: NSButton!
    
    
    @IBAction func chosseHero(_ sender: NSButton) {
        
        switch sender.tag {
        case 0:
            selectedHero = .mago
        case 1:
            selectedHero = .guerrero
        case 2:
            selectedHero = .cazador
        case 3:
            selectedHero = .druida
        case 4:
            selectedHero = .picaro
        case 5:
            selectedHero = .brujo
        case 6:
            selectedHero = .sacerdote
        case 7:
            selectedHero = .paladin
        case 8:
            selectedHero = .chaman
        default:
           print("default chosseHero(_ sender: NSButton)")
        }
        chosseButton.title = "Elegir"
    }
    
    @IBAction func chosseAction(_ sender: Any) {
        
        guard selectedHero != nil else {
             self.dismiss(nil)
             return
        }
        appController.newDeck(forHero:selectedHero)
        newDeckVCDataDelegate?.hero(name:selectedHero.stringName().rawValue)
        newDeckVCDataDelegate?.deck(cards:0)
        self.dismiss(nil)
    }
    
    
    
    var appController:AppController = AppController.shared
    var selectedHero:HeroTypes!
    var newDeckVCDataDelegate:NewDeckVCDataDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
    }
    
    func viewConfiguration() {
        
        chosseButton.title = "Cerrar"
        self.view.wantsLayer = true
        if self.view.layer != nil {
            self.view.layer?.backgroundColor = .black
        }
    }
    
    
}
