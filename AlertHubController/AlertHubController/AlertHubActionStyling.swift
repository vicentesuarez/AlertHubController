//
//  AlertHubActionStyling.swift
//  AlertHubControllerDemo
//
//  Created by Vicente Suarez on 1/24/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

/// Adopted by an object/structure/enum that defines the appearance of an alert action.
public protocol AlertHubActionStyling {
    /// Describes the appearance of an alert action
    var description: AlertHubActionStyleItem { get }
}
