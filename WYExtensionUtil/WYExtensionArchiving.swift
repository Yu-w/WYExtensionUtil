//
//  WYExtensionArchiving.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

class WYArchiving: NSObject {
    
    class func saveByKey(key: String, object: AnyObject!) {
        let homePath = WYArchiving.getPath()
        dispatch_async(GlobalMainQueue) {
            let data = NSMutableData()
            let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
            archiver.encodeObject(object, forKey: key)
            archiver.finishEncoding()
            if data.writeToFile(homePath, atomically: true) {
                print("Arching succeed")
            }else{
                print("Arching failed")
            }
        }
    }
    
    class func findByKey(key: String) -> AnyObject! {
        let homePath = WYArchiving.getPath()
        if let data = NSMutableData(contentsOfFile: homePath) {
            let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
            print(unarchiver.decodeObjectForKey(key))
            return unarchiver.decodeObjectForKey(key)
        }
        return nil
    }
    
    class func getPath()->String{
        var dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        var docsDir: AnyObject?
        docsDir = dirPaths[0]
        return docsDir!.stringByAppendingPathComponent("WYArchiving")
    }
    
}