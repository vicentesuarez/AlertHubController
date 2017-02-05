//
//  TableViewController.swift
//  AlertHubControllerDemo
//
//  Created by Vicente Suarez on 2/4/17.
//  Copyright © 2017 Vicente Suarez. All rights reserved.
//

import UIKit
import AlertHubController

class TableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let index = (indexPath.section, indexPath.row)
        var style = AlertHubStyle.compact
        var title = "Compact"
        var message = "Show Alert"
        
        switch index {
        case (0,1):
            style = .compactLoading
            message = "Show loading then alert"
        case (1,0):
            style = .responsive
            title = "Responsive"
        case (1,1):
            style = .responsiveLoading
            title = "Responsive"
            message = "Show loading then alert"
        case (2,0):
            style = .full
            title = "Full"
        case (2,1):
            style = .fullLoading
            title = "Full"
            message = "Show loading then alert"
        default:
            break
        }
        print(style)
        let alertViewController = AlertHubViewController(title: title, message: message, style: style)
            .addAction(AlertHubAction(title: "Save Changes", style: .primary).setActionTap({_ in print("Save Changes") }))
            .addAction(AlertHubAction(title: "Close", style: .secondary).setActionTap({_ in print("Close") }))
            .setActionTap({_ in print("Close alert")})
        present(alertViewController, animated: true) { _ in
            if indexPath.row == 1 {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
                    alertViewController.showAlertView()
                }
            }
        }
    }

}
