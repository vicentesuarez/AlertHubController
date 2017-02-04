//
//  AlertHubViewController.swift
//  AlertHubController
//
//  Created by Vicente Suarez on 1/17/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

/// Controller that displays an alert view and manages button actions.
public class AlertHubViewController: UIViewController {
    
    // MARK: - Constants -
    
    private static let nibId = "AlertHubViewController"
    
    // MARK: - Private properties -
    
    private var message: String?
    private var showsLoading = false
    private var loadingView: AlertHubLoadingView?
    private var alertView: AlertHubView?
    private var isLoading = false
    private var styles = [AlertHubStyleItem]()
    
    // MARK: - Public properties -
    
    /// Called when the user selects any of the alert buttons
    var onActionTap: ((AlertHubAction?, Int?, String?)->Void)?
    
    private lazy var alertHubPresentationController: AlertHubViewControllerTransitioningDelegate = {
        return AlertHubViewControllerTransitioningDelegate(presentedViewController: self)
    }()
    
    // MARK: - IBAction -
    
    @IBAction func tappedBackground(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Lifecycle -
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alertView?.adjustToSize()
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        isLoading = false
        if showsLoading { alertView?.alpha = 0.0 }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        isLoading = showsLoading
    }
    
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        alertView?.adjustToSize(size)
    }
    
    /// Creates an AlertHubViewController and performs initial configuration
    /// - Parameter title: The title of the alert
    /// - Parameter message: The body of the alert
    /// - Parameter styles: The initial visual configurations of the alert
    public convenience init(title: String?, message: String, styles: [AlertHubStyleItem]) {
        let bundle = Bundle(for: AlertHubViewController.self)
        self.init(nibName: AlertHubViewController.nibId, bundle: bundle)
        self.title = title
        self.message = message
        self.styles = styles
        setup()
    }
    
    /// Creates an AlertHubViewController and performs initial configuration
    /// - Parameter title: The title of the alert
    /// - Parameter message: The body of the alert
    /// - Parameter style: The initial visual configurations of the alert
    public convenience init(title: String?, message: String, style: AlertHubStyle = .primary) {
        self.init(title: title, message: message, styles: style.description)
    }
    
    // MARK: - Configuration -
    
    /// Adds a button to the alert
    /// - Parameter action: Describes the behavior and appearance of the button
    /// - Returns: Self. Discardable.
    @discardableResult public func addAction(_ action: AlertHubAction) -> AlertHubViewController {
        alertView?.addAction(action)
        return self
    }
    
    /// Sets a closure called when the user selects any of the alert buttons
    /// - Parameter onActionTap: Closure that will be called when the user selects any of the alert buttons
    @discardableResult public func setActionTap(_ onActionTap: ((AlertHubAction?, Int?, String?)->Void)?) -> AlertHubViewController {
        self.onActionTap = onActionTap
        return self
    }
    
    /// Animates from loading state to a state where the alert is showing
    /// - Parameter completed: Closure called when the transitioning animation completes.
    /// - Returns: Self. Discardable.
    @discardableResult public func showAlertView(completed: ((AlertHubViewController)->Void)? = nil) -> AlertHubViewController {
        if isLoading {
            isLoading = false
            if alertView == nil { configureAlert(withAlpha: 0.0) }
            UIView.animate(withDuration: AnimationDuration.short, animations: {
                self.loadingView?.alpha = 0.0
                self.alertView?.alpha = 1.0
            }) { _ in
                self.removeLoading()
                completed?(self)
            }
        }
        return self
    }
    
    // MARK: - Private -
    
    private func setup() {
        transitioningDelegate = alertHubPresentationController
        print(styles)
        for style in styles {
            guard case let AlertHubStyleItem.loading(showsLoading) = style else { continue }
            self.showsLoading = showsLoading
            break
        }
        
        switch showsLoading {
        case true: configureLoading()
        case false: configureAlert()
        }
    }
    
    private func configureLoading() {
        loadingView = AlertHubLoadingView.newView()
        loadingView!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingView!)
        loadingView!.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingView!.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingView!.heightAnchor.constraint(equalToConstant: AlertHubSize.loadingLength).isActive = true
        loadingView!.widthAnchor.constraint(equalToConstant: AlertHubSize.loadingLength).isActive = true
    }
    
    private func configureAlert(withAlpha alpha: CGFloat = 1.0) {
        alertView = AlertHubView.newView()
        alertView!.alpha = alpha
        alertView!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alertView!)
        alertView?.title = title ?? String()
        alertView?.message = message ?? String()
        alertView?.onActionTap = { self.onActionTap?($0, $1, $2); self.dismiss(animated: true, completion: nil) }
        alertView!.topAnchor.constraint(equalTo: view.topAnchor, constant: AlertHubSize.alertTop).isActive = true
        alertView!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: AlertHubSize.alertBottom).isActive = true
        
        var layout = AlertHubLayout.responsive
        for style in styles {
            guard case let AlertHubStyleItem.layout(configuredLayout) = style else { continue }
            layout = configuredLayout
            break
        }
        
        switch layout {
        case .compact:
            alertView!.widthAnchor.constraint(equalToConstant: AlertHubSize.alertWidth).isActive = true
            alertView!.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        case .full:
            alertView?.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AlertHubSize.alertSideInset).isActive = true
            alertView?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -AlertHubSize.alertSideInset).isActive = true
        case .responsive:
            alertView!.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: AlertHubSize.alertWidthMultiplier).isActive = true
            alertView!.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        
        alertView?.setStyles(styles)
    }
    
    private func removeLoading() {
        if let loadingView = loadingView {
            loadingView.removeFromSuperview()
            self.loadingView = nil
        }
    }
}
