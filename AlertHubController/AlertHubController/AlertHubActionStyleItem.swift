//
//  AlertHubActionStyleItem.swift
//  AlertHubControllerDemo
//
//  Created by Vicente Suarez on 1/27/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

/// An alert action style configuration
public enum AlertHubActionStyleItem {
    /// The text color of the button title
    case titleColor(UIColor)
    /// The background color of the button
    case backgroundColor(UIColor)
    /// The border color of the button
    case borderColor(UIColor)
    /// The border width of the button
    case borderWidth(CGFloat)
    /// The corner radius of the button
    case cornerRadius(CGFloat)
    /// The content insets of the button
    case contentInsets(UIEdgeInsets)
}
