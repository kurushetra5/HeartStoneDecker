//
//  ImagesDownloader.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 11/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Cocoa

class ImagesDownloader  {

    
    func downloadImages() {
        
        let image = NSImage(byReferencing:NSURL(string: "https://media-hearth.cursecdn.com/avatars/330/992/303.png")! as URL)
        
        //    cardImageView.image = image
        image.writePNG(toURL:URL(fileURLWithPath:"/Users/kurushetra/Developer/HeartStoneDecker/HeartStoneDecker/Images_Downloaded/imagen4.png"))
        
    }
    
}
