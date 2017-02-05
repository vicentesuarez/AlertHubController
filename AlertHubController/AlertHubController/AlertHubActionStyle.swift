//
//  AlertHubActionStyle.swift
//  AlertHubController
//
//  Created by Vicente Suarez on 1/23/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

/// Describes default styles for an alert action
public enum AlertHubActionStyle: AlertHubActionStyling {
    /// Meant for the positive actions of an alert
    case primary
    /// Meant for the neutral or cancel actions of an alert
    case secondary
    /// Action has the appearance of a default iOS UIButton.
    case custom
    
    /// Describes the appearance of an alert action
    public var description: AlertHubActionStyleItem {
        let defaultContentInsets = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        switch self {
        case .primary:
            let backgroundColor = UIColor(red: 2/255, green: 117/255, blue: 216/255, alpha: 1.0)
            return AlertHubActionStyleItem(titleColor: UIColor.white,
                                           backgroundColor: backgroundColor,
                                           borderColor: UIColor.clear,
                                           borderWidth: 0.0,
                                           cornerRadius: 5.0,
                                           contentInsets: defaultContentInsets)
        case .secondary:
            return AlertHubActionStyleItem(titleColor: UIColor(red: 41/255, green: 43/255, blue: 44/255, alpha: 1.0),
                                           backgroundColor: UIColor.white,
                                           borderColor: UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0),
                                           borderWidth: 1.0,
                                           cornerRadius: 5.0,
                                           contentInsets: defaultContentInsets)
        case .custom:
            return AlertHubActionStyleItem()
        }
    }
}
