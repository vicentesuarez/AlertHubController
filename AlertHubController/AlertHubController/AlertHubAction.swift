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
    /// The text color of the button title
    var titleColor: UIColor?
    /// The background color of the button
    var backgroundColor: UIColor?
    /// The border color of the button
    var borderColor: UIColor?
    /// The border width of the button
    var borderWidth: CGFloat?
    /// The corner radius of the button
    var cornerRadius: CGFloat?
    /// The content insets of the button
    var contentInsets: UIEdgeInsets?
    /// Closure called when the button is pressed
    var onActionTap: ((AlertHubAction, Int, String?)->Void)?
    /// Button identifier. Should be unique.
    var identifier: String?
    
    /// Creates an alert action and its initial appearance
    /// - Parameter title: The title of the button
    /// - Parameter styles: Describes the initial appearance of the button
    public init(title: String, styles: [AlertHubActionStyleItem]) {
        self.title = title
        for style in styles {
            switch style {
            case .titleColor(let color):
                self.titleColor = color
            case .backgroundColor(let color):
                self.backgroundColor = color
            case .borderColor(let color):
                self.borderColor = color
            case .borderWidth(let width):
                self.borderWidth = width
            case .cornerRadius(let radius):
                self.cornerRadius = radius
            case .contentInsets(let insets):
                self.contentInsets = insets
            }
        }
    }
    
    /// Creates an alert action and its initial appearance
    /// - Parameter title: The title of the button
    /// - Parameter style: Describes the initial appearance of the button
    public convenience init(title: String, style: AlertHubActionStyle = .custom) {
        self.init(title: title, styles: style.description)
    }
    
    /// Creates an alert action and its initial appearance
    /// - Parameter title: The title of the button
    /// - Parameter style: Describes the initial appearance of the button
    public convenience init(title: String, style: AlertHubActionStyling) {
        self.init(title: title, styles: style.description)
    }
    
    /// Sets the text color of the button title
    /// - Parameter titleColor: The text color of the button title
    @discardableResult public func setTitleColor(_ titleColor: UIColor) -> AlertHubAction {
        self.titleColor = titleColor
        return self
    }
    
    /// Sets the background color of the button
    /// - Parameter backgroundColor: The background color of the button
    @discardableResult public func setBackgroundColor(_ backgroundColor: UIColor) -> AlertHubAction {
        self.backgroundColor = backgroundColor
        return self
    }
    
    /// Sets the border color of the button
    /// - Parameter borderColor: The border color of the button
    @discardableResult public func setBorderColor(_ borderColor: UIColor) -> AlertHubAction {
        self.borderColor = borderColor
        return self
    }
    
    /// Sets the border width of the button
    /// - Parameter borderWidth: The border width of the button
    @discardableResult public func setBorderWidth(_ borderWidth: CGFloat) -> AlertHubAction {
        self.borderWidth = borderWidth
        return self
    }
    
    /// Sets the corner radius of the button
    /// - Parameter cornerRadius: The corner radius of the button
    @discardableResult public func setCornerRadius(_ cornerRadius: CGFloat) -> AlertHubAction {
        self.cornerRadius = cornerRadius
        return self
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
