//
//  WYExtensionUITextField.swift
//  WYUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension UITextField {
    
    func addLeftIcon(img: UIImage?, frame: CGRect, imgSize: CGSize) {
        let leftView = UIView()
        leftView.frame = frame
        let imgView = UIImageView()
        imgView.frame = CGRectMake(frame.width - 8 - imgSize.width, (frame.height - imgSize.height)/2, imgSize.width, imgSize.height)
        imgView.image = img
        leftView.addSubview(imgView)
        self.leftView = leftView
        self.leftViewMode = UITextFieldViewMode.Always
    }
    
    func addLeftBlank(blankSize: CGFloat) {
        let leftView = UIView()
        leftView.frame = CGRectMake(0, 0, blankSize, self.frame.height)
        self.leftView = leftView
        self.leftViewMode = UITextFieldViewMode.Always
    }
}