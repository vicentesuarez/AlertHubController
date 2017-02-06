//
//  AlertHubLoadingView.swift
//  AlertHubController
//
//  Created by Vicente Suarez on 1/22/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

class AlertHubLoadingView: UIView {
    
    private static let nibId = "AlertHubLoadingView"
    
    class func newView() -> AlertHubLoadingView {
        let bundle = Bundle(for: AlertHubLoadingView.self)
        let nib = bundle.loadNibNamed(nibId, owner: self, options: [:])?.first
        return nib as! AlertHubLoadingView
    }
}
