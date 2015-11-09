//
//  WYExtensionUIImage.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension UIImage {
    
    func scaleByPercent(percent: CGFloat) -> UIImage {
        let w = self.size.width * percent
        let h = self.size.height * percent
        return self.scaleFromImage(CGSizeMake(w, h))
    }
    
    func scaleFromImage(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        self.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func subImageByRatio(ratio: CGFloat) -> UIImage! {
        let originalRatio = self.size.width / self.size.height
        
        var w: CGFloat!
        var h: CGFloat!
        var x: CGFloat = 0
        var y: CGFloat = 0
        if ratio >= originalRatio {
            w = self.size.width
            h = w / ratio
            y = (self.size.height - h)/2
        } else {
            h = self.size.height
            w = h * ratio
            x = (self.size.width - w)/2
        }
        return self.subImageByRect(CGRectMake(x, y, w, h))
    }
    
    func subImageByRect(rect: CGRect) -> UIImage! {
        let subImageRef: CGImageRef = CGImageCreateWithImageInRect(self.CGImage, rect)!
        let smallBounds = CGRect(x: 0, y: 0, width: CGImageGetWidth(subImageRef), height: CGImageGetHeight(subImageRef))
        
        UIGraphicsBeginImageContext(smallBounds.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextDrawImage(context, smallBounds, subImageRef)
        let smallImage = UIImage(CGImage: subImageRef)
        UIGraphicsEndImageContext()
        return smallImage
    }
    
}