//
//  WYExtensionString.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension String {
    
    var count: Int { return self.characters.count }
    
    func length() -> Int {
        return self.characters.count
    }
    
    subscript(idx: Int) -> Character {
        return self[self.startIndex.advancedBy(idx)]
    }
    
    func toURL() -> NSURL? {
        return NSURL(string: self)
    }
    
    func addToPasteboard() {
        let pasteboard = UIPasteboard.generalPasteboard()
        pasteboard.string = self
    }
    
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    func testRegularExpression(pattern:String) ->Bool {
        let expression: NSRegularExpression?
        do {
            expression = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
        } catch _ as NSError {
            expression = nil
        }
        let matches = expression?.numberOfMatchesInString(self, options: [], range: NSMakeRange(0, self.characters.count))
        return matches > 0
    }
    
    func stringToInt() -> Int {
        if let i = Int(self) {
            return i
        } else {
            return 0
        }
    }
    
    func fromHtmlToAttributedString() -> NSAttributedString! {
        let htmlData = self.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        let htmlString: NSAttributedString?
        do {
            htmlString = try NSAttributedString(data: htmlData!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
        } catch _ {
            htmlString = nil
        }
        
        return htmlString
    }
}

public func randomStringWithLength (len : Int) -> String {
    
    let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    let randomString : NSMutableString = NSMutableString(capacity: len)
    
    for (var i=0; i < len; i++){
        let length = UInt32 (letters.length)
        let rand = arc4random_uniform(length)
        randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
    }
    
    return randomString as String
}
