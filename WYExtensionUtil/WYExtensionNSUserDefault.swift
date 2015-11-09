//
//  WYExtensionNSUserDefault.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension NSUserDefaults {
    
    static func defaultsRegisterDefaults(registrationDictionary: [String : AnyObject]) {
        NSUserDefaults.standardUserDefaults().registerDefaults(registrationDictionary)
    }
    
    static func defaultsSetValue<T: AnyObject>(value: T?, forKey defaultName: String) -> NSUserDefaults.Type {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        switch value {
        case let realValue as Int:
            userDefaults.setInteger(realValue, forKey: defaultName)
        case let realValue as Float:
            userDefaults.setFloat(realValue, forKey: defaultName)
        case let realValue as Double:
            userDefaults.setDouble(realValue, forKey: defaultName)
        case let realValue as Bool:
            userDefaults.setBool(realValue, forKey: defaultName)
        case let realValue as NSURL:
            userDefaults.setURL(realValue, forKey: defaultName)
        default:
            userDefaults.setObject(value, forKey: defaultName)
        }
        
        return self
    }
    
    static func defaultsValueForKey<T>(name: String, inout value: T?) -> NSUserDefaults.Type {
        let ud = NSUserDefaults.standardUserDefaults()
        
        switch T.self {
        case is Int.Type:
            value = ud.integerForKey(name) as? T
        case is Float.Type:
            value = ud.floatForKey(name) as? T
        case is Double.Type:
            value = ud.doubleForKey(name) as? T
        case is Bool.Type:
            value = ud.boolForKey(name) as? T
        case is NSURL.Type:
            value = ud.URLForKey(name) as? T
        case is String.Type:
            value = ud.stringForKey(name) as? T
        case is NSData.Type:
            value = ud.dataForKey(name) as? T
        default:
            value = ud.objectForKey(name) as? T
        }
        return self
    }
    
    static func defaultsSynchronize() -> Bool {
        return NSUserDefaults.standardUserDefaults().synchronize()
    }
    
}
