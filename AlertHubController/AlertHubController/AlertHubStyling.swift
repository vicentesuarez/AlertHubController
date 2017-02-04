//
//  AlertHubStyling.swift
//  AlertHubController
//
//  Created by Vicente Suarez on 2/3/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import Foundation

/// Adopted by an object/structure/enum that defines the appearance of an alert.
public protocol AlertHubStyling {
    /// Describes the appearance of an alert
    var description: [AlertHubStyleItem] { get }
}
