//
//  WebDownloader.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 11/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Cocoa



protocol WebDownloaderDelegate {
    func newDownloaded(card:Dictionary<String,String>)
}



class WebDownloader {

    
    
    var initialWebLink:String = "http://www.playhs.es/cartas-hs/es/?vista=1&page="
//    http://www.playhs.es/cartas-hs/es/?vista=2&page=1
    var webSufix:String = "&page="
    var webPraser:htmlWebPraser = htmlWebPraser()
    var webDownloaderDelegate:WebDownloaderDelegate!
    
    
    
    func startDownloadCards() {
        
        for pageNumber in 1..<27 {
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
                webPraser.parseWeb(data:webData,webIndex:webIndex, completion: { (cardDictionary) in
//                    print(cardDictionary)
                    webDownloaderDelegate?.newDownloaded(card:cardDictionary)
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
            completion(htmlSource.html2String)
            
            print(htmlSource.html2String)
            
        }
        catch let error as NSError {
            print("Mierda! Algo ha fallado: \(error)")
        }
    }

    
    
    
}
