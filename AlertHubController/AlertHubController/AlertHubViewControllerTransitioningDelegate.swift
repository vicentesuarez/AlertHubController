//
//  AlertHubViewControllerTransitioningDelegate.swift
//  AlertHubController
//
//  Created by Vicente Suarez on 1/22/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit

class AlertHubViewControllerTransitioningDelegate: NSObject {
    private let showAlpha: CGFloat = 1.0
    private let hideAlpha: CGFloat = 0.0
    
    fileprivate var isPresenting = false
    
    init(presentedViewController: UIViewController) {
        presentedViewController.modalPresentationStyle = .custom
    }
    
    fileprivate func animatePresentationWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        guard let view = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)?.view else {
            return
        }
        let containerView = transitionContext.containerView
        containerView.addSubview(view)
        view.frame = containerView.bounds
        view.leftAnchor.constraint(equalTo: containerView.leftAnchor)
        view.rightAnchor.constraint(equalTo: containerView.rightAnchor)
        view.topAnchor.constraint(equalTo: containerView.topAnchor)
        view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: AnimationDuration.short, animations: {
            view.alpha = self.showAlpha
        }) { completed in
            transitionContext.completeTransition(completed)
        }
    }
    
    fileprivate func animateDismissalWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        guard let view = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)?.view else {
            return
        }
        UIView.animate(withDuration: AnimationDuration.short, animations: {
            view.alpha = self.hideAlpha
        }) { completed in
            transitionContext.completeTransition(completed)
        }
    }
}

extension AlertHubViewControllerTransitioningDelegate: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
}

extension AlertHubViewControllerTransitioningDelegate: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return AnimationDuration.short
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch isPresenting {
        case true:
            animatePresentationWithTransitionContext(transitionContext: transitionContext)
        case false:
            animateDismissalWithTransitionContext(transitionContext: transitionContext)
        }
    }
}
