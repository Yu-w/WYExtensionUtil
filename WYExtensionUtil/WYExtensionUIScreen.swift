//
//  WYExtensionUIScreen.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension UIScreen {
    
    class var screenWidth: CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }
    
    class var screenHeight: CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }
    
    class var screenBounds: CGRect {
        return UIScreen.mainScreen().bounds
    }
    
    class var screenScale: CGFloat {
        return UIScreen.mainScreen().scale
    }
}