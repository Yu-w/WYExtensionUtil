//
//  WYExtensionUIImageView.swift
//  WYExtensionUtil
//
//  Created by Wang Yu on 11/9/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit

extension UIImageView {
    
    public func setURL(url: NSURL?, placeholderImage: UIImage?) {
        if let placeholder = placeholderImage {
            self.image = placeholder
        }
        if let urlString = url?.absoluteString {
            ImageLoader.sharedInstance.imageForUrl(urlString) { [weak self] image, url in
                if let strongSelf = self {
                    dispatch_async(dispatch_get_main_queue()) {
                        if urlString == url {
                            strongSelf.image = image ?? placeholderImage
                        }
                    }
                }
            }
        }
    }
}
