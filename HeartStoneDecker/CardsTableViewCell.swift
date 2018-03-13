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
    
}
