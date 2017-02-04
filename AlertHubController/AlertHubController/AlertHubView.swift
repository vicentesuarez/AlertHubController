//
//  AlertHubView.swift
//  AlertHubController
//
//  Created by Vicente Suarez on 1/22/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

class AlertHubView: UIView {

    private static let nibId = "AlertHubView"
    private var layout = AlertHubLayout.responsive
    private var actions = [AlertHubAction]()
    
    var title: String {
        get {
            return titleLabel.text ?? String()
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var message: String {
        get {
            return messageLabel.text ?? String()
        }
        set {
            messageLabel.text = newValue
        }
    }
    
    var onActionTap: ((AlertHubAction?, Int?, String?)->Void)?
    var tappedBackground: (()->Void)?
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var messageLabel: UILabel!
    @IBOutlet private var buttonStackView: UIStackView!
    @IBOutlet private var buttonContainerStackView: UIStackView!
    @IBOutlet private var closeButton: UIButton!
    
    @IBAction func tappedCloseButton(_ sender: UIButton) {
        onActionTap?(nil, nil, nil)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        if let _ = hitView as? UIScrollView {
            return nil
        }
        return hitView
    }
    
    class func newView() -> AlertHubView {
        let bundle = Bundle(for: AlertHubView.self)
        let nib = bundle.loadNibNamed(nibId, owner: self, options: [:])?.first
        let alertHubView = nib as! AlertHubView
        alertHubView.layer.masksToBounds = false
        alertHubView.scrollView.layer.masksToBounds = false
        return alertHubView
    }
    
    func addAction(_ action: AlertHubAction) {
        let button = UIButton(type: .custom)
        button.setTitle(action.title, for: UIControlState())
        button.layer.masksToBounds = true
        
        if let titleColor = action.titleColor {
            button.setTitleColor(titleColor, for: UIControlState())
        }
        if let backgroundColor = action.backgroundColor {
            button.setBackgroundImage(backgroundColor.image, for: UIControlState())
        }
        if let borderColor = action.borderColor {
            button.layer.borderColor = borderColor.cgColor
        }
        if let borderWidth = action.borderWidth {
            button.layer.borderWidth = borderWidth
        }
        if let cornerRadius = action.cornerRadius {
            button.layer.cornerRadius = cornerRadius
        }
        if let contentInsets = action.contentInsets {
            button.contentEdgeInsets = contentInsets
        }
        self.buttonStackView.addArrangedSubview(button)
        self.actions.append(action)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func setStyles(_ styles: [AlertHubStyleItem]) {
        for style in styles {
            switch style {
            case .titleColor(let color):
                self.titleLabel.textColor = color
            case .messageColor(let color):
                self.messageLabel.textColor = color
            case .backgroundColor(let color):
                self.contentView.backgroundColor = color
            case .borderColor(let color):
                self.contentView.layer.borderColor = color.cgColor
            case .borderWidth(let width):
                self.contentView.layer.borderWidth = width
            case .cornerRadius(let radius):
                self.contentView.layer.cornerRadius = radius
            case .layout(let layout):
                self.layout = layout
            case .shadowColor(let color):
                print("shadowColor \(color)")
                self.contentView.layer.shadowColor = color.cgColor
            case .shadowOpacity(let opacity):
                self.contentView.layer.shadowOpacity = Float(opacity)
            case .shadowOffset(let offset):
                print("shadowOffset \(offset)")
                self.contentView.layer.shadowOffset = offset
            default:
                break
            }
        }
    }
    
    func adjustToSize(_ size: CGSize) {
        var width: CGFloat
        switch layout {
        case .compact:
            width = AlertHubSize.alertWidth
        case .full:
            width = size.width - (AlertHubSize.alertSideInset * 2)
        case .responsive:
            width = size.width * AlertHubSize.alertWidthMultiplier
        }
        adjustToWidth(width)
    }
    
    func adjustToSize() {
        layoutIfNeeded()
        OperationQueue.main.addOperation {
            self.adjustToWidth(self.bounds.size.width)
        }
    }
    
    private func adjustToWidth(_ width: CGFloat) {
        var buttonWidth: CGFloat = 0.0
        buttonStackView.arrangedSubviews.forEach { view in
            if let button = view as? UIButton {
                let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
                let boundingBox = button.title(for: .normal)!.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: button.titleLabel!.font], context: nil)
                buttonWidth += boundingBox.width + button.contentEdgeInsets.left + button.contentEdgeInsets.right
            }
        }
        buttonWidth += buttonStackView.layoutMargins.left
            + buttonStackView.layoutMargins.right
            + (buttonStackView.spacing * CGFloat(max(buttonStackView.arrangedSubviews.count - 1, 0)))
        
        switch buttonStackView.axis {
        case .horizontal:
            if (buttonWidth >= width) {
                buttonContainerStackView.alignment = .fill
                buttonStackView.axis = .vertical
                buttonStackView.distribution = .fill
            }
            break
        case .vertical:
            if (width > buttonWidth) {
                buttonContainerStackView.alignment = .trailing
                buttonStackView.axis = .horizontal
                buttonStackView.distribution = .equalSpacing
            }
            break
        }
    }
    
    @objc private func buttonTapped(_ button: UIButton) {
        let index = buttonStackView.subviews.index(of: button)!
        let action = actions[index]
        let identifier = action.identifier
        onActionTap?(action, index, identifier)
        action.onActionTap?(action, index, identifier)
    }
}
