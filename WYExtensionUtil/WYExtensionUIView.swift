//
//  WYExtensionUIView.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import QuartzCore

extension UIView {
    
    func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.CGColor
        self.layer.borderWidth = width
    }
    
    func setFrameByCenterPoint(rect: CGRect) {
        self.bounds = CGRectMake(0, 0, rect.width, rect.height)
        self.center.x = rect.origin.x
        self.center.y = rect.origin.y
    }
    
    var centerX: CGFloat {
        return self.bounds.width / 2
    }
    
    var centerY: CGFloat {
        return self.bounds.height / 2
    }
    
    var centerPoint: CGPoint {
        return CGPointMake(self.centerX, self.centerY)
    }
    
    var endX: CGFloat {
        return self.frame.size.width + self.frame.origin.x
    }
    
    var endY: CGFloat {
        return self.frame.size.height + self.frame.origin.y
    }
    
    var marginWidth: CGFloat {
        return 10
    }
    
    func addBottomLine(color: UIColor, lineWidth: CGFloat) {
        let lineView = UIView()
        lineView.frame = CGRectMake(0, self.frame.size.height-lineWidth, UIScreen.mainScreenWidth, lineWidth)
        lineView.backgroundColor = color
        self.addSubview(lineView)
    }
    
    //load a UIView fom xib
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
    
    //get UIImage of a UIView
    func getTheImageOfTheView() ->UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        self.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage
    }
    
    //round Corner for UIView
    func roundCorner(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSizeMake(radius, radius))
        let mask = CAShapeLayer()
        mask.frame = self.bounds;
        mask.path = maskPath.CGPath;
        layer.mask = mask;
    }
    
    //add shadow To Layer
    func addShadow() {
        layer.shadowOffset = CGSizeMake(0, 2);
        layer.shadowRadius = 1;
        layer.shadowOpacity = 0.3;
    }
}
