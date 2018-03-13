//
//  webDownloaderPage2.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 12/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Cocoa

class webDownloaderPage2  {

    
    var initialWebLink:String = "http://www.playhs.es/cartas-hs/es/?vista=2&page="
//        http://www.playhs.es/cartas-hs/es/?vista=2&page=1
//    var webSufix:String = "&page="
    var webPraser:htmlWebPraser = htmlWebPraser()
    
    
    
    func startDownloadCards() {
        
        for pageNumber in 1..<2 {
            let urlCards:String = initialWebLink + "\(pageNumber)"
            downloadWeb(url: urlCards,webIndex:"\(pageNumber)")
            
        }
        //        let urlCards:String = initialWebLink + "2"
        //        downloadWeb(url: urlCards,webIndex:"2")
    }
    
    
    
    
    
    func downloadWeb(url:String,webIndex:String) {
        downloadWeb(url:url) { (webData) in
            //            print(webData)
            if webData.count > 100 {
                webPraser.parseWeb2(data:webData,webIndex:webIndex, completion: { (dictionaries) in
                    print(dictionaries)
                    
                })
            }else {
                print("No hay Datos... Internet ???")
            }
            
        }
    }
    
    
    
    func downloadWeb(url:String,completion:(String) -> Void) {
        
        let webURL = URL(string:url)
        do {
            let htmlSource = try String.init(contentsOf:webURL!,encoding:String.Encoding.utf8)
            completion(htmlSource)
//             print(htmlSource)
        }
        catch let error as NSError {
            print("Mierda! Algo ha fallado: \(error)")
        }
    }

    
}
