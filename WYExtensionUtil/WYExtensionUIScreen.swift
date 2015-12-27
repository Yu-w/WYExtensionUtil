//
//  WYExtensionUIScreen.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension UIScreen {
    
    class var mainScreenWidth: CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }
    
    class var mainScreenHeight: CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }
    
    class var mainScreenBounds: CGRect {
        return UIScreen.mainScreen().bounds
    }
    
    class var mainScreenScale: CGFloat {
        return UIScreen.mainScreen().scale
    }
}