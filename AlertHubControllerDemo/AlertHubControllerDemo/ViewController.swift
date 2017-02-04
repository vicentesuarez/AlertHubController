//
//  ViewController.swift
//  AlertHubControllerDemo
//
//  Created by Vicente Suarez on 1/16/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit
import AlertHubController

class ViewController: UIViewController {
    
    @IBAction func pressedButton(_ sender: UIButton) {
        present(AlertHubViewController(title: "Testing", message: "Testing message", style: .primary)
            .addAction(AlertHubAction(title: "Primary", style: .primary).setActionTap({ $ in print("index \($.1)") }))
            .addAction(AlertHubAction(title: "Secondary", style: .secondary).setActionTap({ $ in print("index \($.1)") }))
            , animated: true, completion: nil)
    }
}

