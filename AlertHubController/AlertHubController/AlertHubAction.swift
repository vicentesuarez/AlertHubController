//
//  AlertHubAction.swift
//  AlertHubController
//
//  Created by Vicente Suarez on 1/22/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

/// Describes the behavior and appearance of an alert button
public class AlertHubAction {
    /// The title of the button
    var title: String
    /// Closure called when the button is pressed
    var onActionTap: ((AlertHubAction, Int, String?)->Void)?
    /// Button identifier. Should be unique.
    var identifier: String?
    /// Alert action style configuration
    var style: AlertHubActionStyleItem
    
    /// Creates an alert action and its initial appearance
    /// - Parameter title: The title of the button
    /// - Parameter styles: Describes the initial appearance of the button
    public init(title: String, styleItem: AlertHubActionStyleItem) {
        self.title = title
        self.style = styleItem
    }
    
    /// Creates an alert action and its initial appearance
    /// - Parameter title: The title of the button
    /// - Parameter style: Describes the initial appearance of the button
    public convenience init(title: String, style: AlertHubActionStyle = .custom) {
        self.init(title: title, styleItem: style.description)
    }
    
    /// Creates an alert action and its initial appearance
    /// - Parameter title: The title of the button
    /// - Parameter style: Describes the initial appearance of the button
    public convenience init(title: String, style: AlertHubActionStyling) {
        self.init(title: title, styleItem: style.description)
    }
    
    /// Sets a closure called when the button is pressed
    /// - Parameter onActionTap: Called when the button is pressed
    @discardableResult public func setActionTap(_ onActionTap: ((AlertHubAction, Int, String?)->Void)?) -> AlertHubAction {
        self.onActionTap = onActionTap
        return self
    }
    
    /// Sets an identifier for the button.
    /// - Parameter identifier: Button identifier. Should be unique.
    @discardableResult public func setIdentifier(_ identifier: String) -> AlertHubAction {
        self.identifier = identifier
        return self
    }
}
