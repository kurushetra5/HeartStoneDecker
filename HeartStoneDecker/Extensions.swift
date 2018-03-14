//
//  Extensions.swift
//  HeartStoneDecker
//
//  Created by Kurushetra on 10/3/18.
//  Copyright © 2018 Kurushetra. All rights reserved.
//

import Foundation
import Cocoa


extension NSButton {
    
    func switchOpacity() {
        
        if self.state.rawValue == 0 {
            switchOpacityOff()
        }else {
            switchOpacityOn()
        }
    }
    
    func switchOpacityOff() {
        self.layer?.opacity = 0.5
    }
    func switchOpacityOn() {
        self.layer?.opacity = 1.0
    }
    
}


extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}



extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}



public extension NSImage {
    
    public func writePNG(toURL url: URL) {
        
        guard let data = tiffRepresentation,
            let rep = NSBitmapImageRep(data: data),
            let imgData = rep.representation(using: .png, properties: [.compressionFactor : NSNumber(floatLiteral: 1.0)]) else {
                
                Swift.print("\(self.self) Error Function '\(#function)' Line: \(#line) No tiff rep found for image writing to \(url)")
                return
        }
        
        do {
            try imgData.write(to: url)
        }catch let error {
            Swift.print("\(self.self) Error Function '\(#function)' Line: \(#line) \(error.localizedDescription)")
        }
    }
}
