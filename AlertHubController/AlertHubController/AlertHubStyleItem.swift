//
//  AlertHubStyleItem.swift
//  AlertHubController
//
//  Created by Vicente Suarez on 2/3/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

/// An alert style configuration
public enum AlertHubStyleItem {
    /// The text color of the alert title
    case titleColor(UIColor)
    /// The text color of the alert body
    case messageColor(UIColor)
    /// The background color of the alert
    case backgroundColor(UIColor)
    /// The border color of the alert
    case borderColor(UIColor)
    /// The border width of the alert
    case borderWidth(CGFloat)
    /// The corner radius of the alert
    case cornerRadius(CGFloat)
    /// The shadow color of the alert
    case shadowColor(UIColor)
    /// The shadow offset of the alert
    case shadowOffset(CGSize)
    /// The opacity of the alert's shadow
    case shadowOpacity(CGFloat)
    /// The layout configuration of the alert
    case layout(AlertHubLayout)
    /// Sets whether the alert will present in a loading state
    case loading(Bool)
}
