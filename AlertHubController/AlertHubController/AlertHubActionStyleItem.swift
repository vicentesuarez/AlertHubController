//
//  AlertHubActionStyleItem.swift
//  AlertHubControllerDemo
//
//  Created by Vicente Suarez on 1/27/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

/// An alert action style configuration
public struct AlertHubActionStyleItem {
    /// The text color of the button title
    public var titleColor = UIColor.black
    /// The background color of the button
    public var backgroundColor = UIColor.white
    /// The border color of the button
    public var borderColor = UIColor.lightGray
    /// The border width of the button
    public var borderWidth: CGFloat = 1.0
    /// The corner radius of the button
    public var cornerRadius: CGFloat = 0.0
    /// The content insets of the button
    public var contentInsets = UIEdgeInsets.zero
}
