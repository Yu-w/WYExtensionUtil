//
//  WYExtensionUIView.swift
//  WYUtil
//
//  Created by Wang Yu on 11/28/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension Array {

    var decompose: (head: Element, tail: [Element])? {
        return count > 0 ? (self[0], Array(self[1..<count])) : nil
    }
    
}
