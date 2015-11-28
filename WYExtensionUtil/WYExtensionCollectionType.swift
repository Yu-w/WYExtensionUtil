//
//  WYExtensionUIView.swift
//  WYUtil
//
//  Created by Wang Yu on 11/28/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension CollectionType where Index == Int {
    var decompose: (head: Generator.Element, tail: SubSequence)? {
        return (count > 0) ? (self[0], self[1..<count]) : nil
    }
}