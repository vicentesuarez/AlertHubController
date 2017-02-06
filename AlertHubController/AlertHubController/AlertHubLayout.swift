//
//  AlertHubLayout.swift
//  AlertHubController
//
//  Created by Vicente Suarez on 2/3/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import Foundation

/// The layout configuration of an alert
public enum AlertHubLayout {
    /// Alert width is 304.0
    case compact
    /// Alert width is 75% of the screen width
    case responsive
    /// Alert width is screen width - 16.0
    case full
}
