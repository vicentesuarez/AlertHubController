//
//  AlertHubStyleItem.swift
//  AlertHubController
//
//  Created by Vicente Suarez on 2/3/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

/// An alert style configuration
public struct AlertHubStyleItem {
    /// The text color of the alert title
    var titleColor = UIColor.black
    /// The text color of the alert body
    var messageColor = UIColor.black
    /// The background color of the alert
    var backgroundColor = UIColor.white
    /// The border color of the alert
    var borderColor = UIColor.lightGray
    /// The border width of the alert
    var borderWidth: CGFloat = 0.0
    /// The corner radius of the alert
    var cornerRadius: CGFloat = 0.0
    /// The shadow color of the alert
    var shadowColor = UIColor.clear
    /// The shadow offset of the alert
    var shadowOffset = CGSize.zero
    /// The opacity of the alert's shadow
    var shadowOpacity: CGFloat = 0.0
    /// The layout configuration of the alert
    var layout = AlertHubLayout.compact
    /// Sets whether the alert will present in a loading state
    var loading = true
}
