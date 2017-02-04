//
//  UIColor+UIImage.swift
//  AletHubController
//
//  Created by Vicente Suarez on 6/22/16.
//  Copyright © 2016 Vicente Suarez. All rights reserved.
//

import UIKit

extension UIColor {
    
    var image: UIImage {
        return imageWithSize(CGSize(width: 1.0, height: 1.0))
    }
    
    func imageWithSize(_ size: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
