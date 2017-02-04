//
//  AlertHubStyle.swift
//  AlertHubController
//
//  Created by Vicente Suarez on 1/23/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

/// Describes default styles for an alert
public enum AlertHubStyle {
    /// The default appearane for an alert
    case primary
    /// The default appearane for an alert that begins with a loading state
    case primaryLoading
    /// Alert elements all have the basic appearance of a default iOS view object.
    case custom
    
    /// Describes the appearance of an alert
    var description: [AlertHubStyleItem] {
        var styles: [AlertHubStyleItem] = []
        switch self {
        case .custom:
            break
        case .primaryLoading:
            styles.append(.loading(true))
            fallthrough
        case .primary:
            let textColor = UIColor(red: 41/255, green: 43/255, blue: 44/255, alpha: 1.0)
            styles.append(contentsOf: [.titleColor(textColor),
                                       .messageColor(textColor),
                                       .backgroundColor(UIColor.white),
                                       .borderColor(UIColor.black.withAlphaComponent(0.2)),
                                       .borderWidth(1.0),
                                       .cornerRadius(5.0),
                                       .shadowColor(UIColor.black),
                                       .shadowOffset(CGSize(width: 5.0, height: 5.0)),
                                       .shadowOpacity(0.5)])
        }
        return styles
    }
}
