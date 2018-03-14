//
//  CardsTableViewCell.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 11/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Cocoa

class CardsTableViewCell: NSTableCellView {

    @IBOutlet weak var cardImage: NSImageView!
    
    @IBOutlet weak var CardNameText: NSTextField!
    
    @IBOutlet weak var attack: NSTextField!
    @IBOutlet weak var health: NSTextField!
    @IBOutlet weak var type: NSTextField!
    @IBOutlet weak var theClass: NSTextField!
    @IBOutlet weak var cost: NSTextField!
    @IBOutlet weak var image: NSImageView!
    
    
    func chosseImage() {
        
        switch  theClass.stringValue {
        case "Mago ":
            image.image = #imageLiteral(resourceName: "Mago")
        case "Guerrero ":
            image.image = #imageLiteral(resourceName: "Guerrero copy")
        case "Cazador ":
            image.image = #imageLiteral(resourceName: "Cazador")
        case "Druida ":
            image.image = #imageLiteral(resourceName: "Druida")
        case "Pícaro ":
            image.image = #imageLiteral(resourceName: "Picara")
        case "Brujo ":
            image.image = #imageLiteral(resourceName: "Brujo copy")
        case "Sacerdote ":
            image.image = #imageLiteral(resourceName: "Sacerdote")
        case "Paladín ":
            image.image = #imageLiteral(resourceName: "Paladin")
        case "Chamán ":
            image.image = #imageLiteral(resourceName: "Chaman copy")
        case "Neutral ":
            image.image = #imageLiteral(resourceName: "Mago")
        default:
            print("Default de chosseImage()")
        }
    }
    
}
