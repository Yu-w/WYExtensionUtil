//
//  WYExtensionUIButton.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension UIButton {
    
    public func setURL(url: NSURL?, placeholderImage: UIImage?, forState state: UIControlState) {
        if let placeholder = placeholderImage {
            self.setImage(placeholder, forState: state)
        }
        if let urlString = url?.absoluteString {
            ImageLoader.sharedInstance.imageForUrl(urlString) { [weak self] image, url in
                if let strongSelf = self {
                    dispatch_async(dispatch_get_main_queue()) {
                        if urlString == url {
                            strongSelf.setImage(image, forState: state)
                        }
                    }
                }
            }
        }
    }
    
    //    var normalColor:UIColor = UIColor.whiteColor()
    //    var highlightColor:UIColor = COLOR_F2F4F8
    //    var normalTitleColor:UIColor = COLOR_333
    //    var highlightTitleColor:UIColor = COLOR_333
    
    var normalColor:UIColor {
        return UIColor.whiteColor()
    }
    
    var highlightColor:UIColor {
        return UIColor.colorWithHexCode("fefdfc")
    }
    
    func setTapHighlight() {
        self.addTarget(self, action: "changeColor:", forControlEvents: UIControlEvents.TouchDown)
    }
    
    func changeColor(button:UIButton) {
        button.backgroundColor = highlightColor
        // button.setTitleColor(highlightTitleColor, forState: UIControlState.Normal)
        button.addTarget(self, action: "reviewColor:", forControlEvents: UIControlEvents.TouchCancel)
        button.addTarget(self, action: "reviewColor:", forControlEvents: UIControlEvents.TouchUpInside)
        button.addTarget(self, action: "reviewColor:", forControlEvents: UIControlEvents.TouchUpOutside)
    }
    
    func reviewColor(btn:UIButton) {
        UIView.animateWithDuration(0.2, animations: {
            btn.alpha = 0.9
            }) { (successed) -> Void in
                btn.alpha = 1.0
                btn.backgroundColor = self.normalColor
                // btn.setTitleColor(self.normalTitleColor, forState: UIControlState.Normal)
        }
    }
}