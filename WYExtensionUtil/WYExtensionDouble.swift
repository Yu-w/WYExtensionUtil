//
//  WYExtensionUITextField.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension Double {
    
    // let f = ".2"
    // print("double:\(b.format(f))")
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}