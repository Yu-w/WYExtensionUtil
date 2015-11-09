//
//  WYExtensionUILabel.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension UILabel {
    
    //Auto resizing the height
    func initWithAutoHeight(rect: CGRect, textColor: UIColor, fontSize: CGFloat, text: String, lineSpacing: CGFloat) {
        self.frame = rect
        self.textColor = textColor
        self.font = UIFont.systemFontOfSize(fontSize)
        self.numberOfLines = 0
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, text.characters.count))
        self.attributedText = attributedString
        self.sizeToFit()
        self.frame.size.width = rect.width
        self.frame.size.height = max(self.frame.size.height, rect.height)
    }
    
    func autoHeight(rect: CGRect, lineSpacing: CGFloat) {
        self.frame = rect
        if self.text != nil {
            self.numberOfLines = 0
            let attributedString = NSMutableAttributedString(string: self.text!)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            let str: NSString = self.text!
            attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, str.length))
            self.attributedText = attributedString
            self.sizeToFit()
            self.frame.size.width = rect.width
            self.frame.size.height = max(self.frame.size.height, rect.height)
        }
    }
    
    func autoHeightByLineSpace(lineSpacing: CGFloat) {
        self.autoHeight(self.frame, lineSpacing: lineSpacing)
    }
    
    func setForTitleByFont(fontSize: CGFloat) {
        self.textColor = UIColor.whiteColor()
        self.textAlignment = NSTextAlignment.Center
        self.font = UIFont.systemFontOfSize(fontSize)
    }
    
    func sizeToFitHeight() {
        let width = self.frame.width
        self.sizeToFit()
        self.frame.size.width = width
    }
    
    func sizeToFitWidth() {
        let height = self.frame.height
        self.sizeToFit()
        self.frame.size.height = height
    }
    
    func addTextByColor(texts: [MutableColoredText]) {
        var curStr = ""
        for text in texts {
            curStr += text.text
        }
        
        let countStr = NSMutableAttributedString(string: curStr)
        for text in texts {
            if (curStr as NSString).rangeOfString(text.text).location != NSNotFound{
                countStr.addAttribute(NSForegroundColorAttributeName, value: text.color, range: (curStr as NSString).rangeOfString(text.text))
            }
        }
        self.attributedText = countStr
    }
}

//多种颜色的label
struct MutableColoredText {
    var text: String!
    var color: UIColor!
    init(text: String, color: UIColor){
        self.text = text
        self.color = color
    }
}

