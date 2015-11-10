//
//  WYExtensionSoundPlayer.swift
//  WYExtensionUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//
//  Credit to Spring, MengTo

import UIKit
import AudioToolbox

struct SoundPlayer {
    
    static var filename : String?
    static var enabled : Bool = true
    
    private struct Internal {
        static var cache = [NSURL:SystemSoundID]()
    }
    
    static func playSound(soundFile: String) {
        
        if !enabled {
            return
        }
        
        if let url = NSBundle.mainBundle().URLForResource(soundFile, withExtension: nil) {
            
            var soundID : SystemSoundID = Internal.cache[url] ?? 0
            
            if soundID == 0 {
                AudioServicesCreateSystemSoundID(url, &soundID)
                Internal.cache[url] = soundID
            }
            
            AudioServicesPlaySystemSound(soundID)
            
        } else {
            print("Could not find sound file name `\(soundFile)`")
        }
    }
    
    static func play(file: String) {
        self.playSound(file)
    }
}
