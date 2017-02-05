//
//  AlertHubStyle.swift
//  AlertHubController
//
//  Created by Vicente Suarez on 1/23/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

/// Describes default styles for an alert
public enum AlertHubStyle: AlertHubStyling {
    /// The alert stays at 304.0 width regarless of screen width.
    case compact
    /// Initial state is loading and the alert stays at 304.0 width regarless of screen width.
    case compactLoading
    /// The alert width is always 75% of the device width.
    case responsive
    /// Initial state is loading and the alert width is always 75% of the device width.
    case responsiveLoading
    /// The alert takes most of the width of the screen
    case full
    /// Initial state is loading and the alert takes most of the width of the screen
    case fullLoading
    case custom
    
    /// Describes the appearance of an alert
    public var description: AlertHubStyleItem {
        let textColor = UIColor(red: 41/255, green: 43/255, blue: 44/255, alpha: 1.0)
        var style = AlertHubStyleItem(titleColor: textColor,
                                      messageColor: textColor,
                                      backgroundColor: UIColor.white,
                                      borderColor: UIColor.black.withAlphaComponent(0.2),
                                      borderWidth: 1.0,
                                      cornerRadius: 5.0,
                                      shadowColor: UIColor.black,
                                      shadowOffset: CGSize(width: 5.0, height: 5.0),
                                      shadowOpacity: 0.5,
                                      layout: .compact,
                                      loading: false)
        switch self {
        case .compact:
            break
        case .compactLoading:
            style.loading = true
        case .responsive:
            style.layout = .responsive
        case .responsiveLoading:
            style.layout = .responsive
            style.loading = true
        case .full:
            style.layout = .full
        case .fullLoading:
            style.layout = .full
            style.loading = true
        case .custom:
            style = AlertHubStyleItem()
        }
        return style
    }
}
