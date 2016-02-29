//
//  WYExtensionAnimation.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension UIView {
    
    func scaleMyView() {
        let newTransform: CGAffineTransform = CGAffineTransformScale(self.transform, 0.1, 0.1)
        self.transform = newTransform
        self.alpha = 0
    }
    
    func scaleBigAnimation() {
        self.scaleBigWithTime(0.35) { () -> Void in
            self.transform = CGAffineTransformIdentity
        }
    }
    
    func scaleBigWithTime(time: NSTimeInterval, handle: ()->()) {
        UIView.animateWithDuration(time, animations: { () -> Void in
            let newTransform = CGAffineTransformConcat(self.transform, CGAffineTransformInvert(self.transform))
            self.transform = newTransform
            self.alpha = 1
            }) { (finished) -> Void in
                handle()
        }
    }
    
    func scaleSmallWithTime(time: NSTimeInterval, handle: ()->()) {
        UIView.animateWithDuration(time, animations: { () -> Void in
            let newTransform: CGAffineTransform = CGAffineTransformScale(self.transform, 0.1, 0.1)
            self.transform = newTransform
            self.alpha = 0
            }) { (finished) -> Void in
                if finished { handle() }
        }
    }
    
    func scaleSmallAnimation() {
        self.scaleSmallWithTime(0.35) { () -> Void in
            self.removeFromSuperview()
        }
    }
    
    //Mark: shake animations
    func shakeAnimation() {
        UIView.animateKeyframesWithDuration(0.08, delay: 0, options: [.Repeat,.Autoreverse,.AllowUserInteraction], animations: { () -> Void in
            self.transform = CGAffineTransformMakeRotation(0.05)
            self.transform = CGAffineTransformMakeTranslation(3, 0)
            }, completion: { (finished) -> Void in
        })
    }
    
    func stopShakeAnimation(){
        self.transform = CGAffineTransformIdentity
        self.shakeAnimation()
        self.transform = CGAffineTransformIdentity
    }
    
    //add CAAnimation with transformation
    func addTransformAnimation(view: UIView, key: String, values:[AnyObject], keyTimes: NSArray, duration:CFTimeInterval = 1.0, waitTime:CFTimeInterval, delegate:AnyObject) {
        let transformAnim = CAKeyframeAnimation(keyPath:"transform")
        transformAnim.values = values
        transformAnim.keyTimes = keyTimes as? [NSNumber]
        transformAnim.duration = duration
        transformAnim.beginTime = CACurrentMediaTime() + waitTime
        transformAnim.fillMode = kCAFillModeForwards
        if let deleg: AnyObject = delegate {
            transformAnim.delegate = deleg
        }
        transformAnim.removedOnCompletion = false
        view.layer.addAnimation(transformAnim, forKey: key)
    }
    
}