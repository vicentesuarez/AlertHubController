# Alert Hub Controller
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](./LICENSE)

The AlertHubController is a customizable view controller that displays an alert. The alert default appearance is based on Boostrap.

![Alert Hub Controller Demo](media/AlertHubControllerDemo.gif?raw=true "Alert Hub Controller Demo")

## Minimum Requirements

### Runtime:
- iOS 9.0

### Build Time:
- Xcode 8.2.1
- Swift 3.0.2

## Installation

### [Carthage]

[Carthage]: https://github.com/Carthage/Carthage

Add the following to your Cartfile:

```ruby
github "vicentesuarez/AlertHubController"
```

Then run `carthage update`.

Follow the current instructions in [Carthage's README][carthage-installation]
for up to date installation instructions.

[carthage-installation]: https://github.com/Carthage/Carthage/blob/master/README.md

### Manual

1. Clone this repo or click "Download ZIP" on the side.
2. Copy all of the Swift and storyboard files in the "AlertHubController/AlertHubController" folder into your project. You probably want to check the box that says "Copy items if needed" as well as make sure that the target you want to add the files to is checked.

## Usage

### Basic Setup

The alert hub view controller functions similar to the native alert view controller. To use it, you follow these steps:

1. Add the import inside the view controller where you want to present the alert.
2. Create the alert hub view controller.
3. Add buttons selections to the alert.
    1. Create an alert action.
    2. Set a closure to perform on button tap.
    3. Adde the action to the alert.
3. Present the alert view controller

```swift
import AlertHubController

...

let alertViewController = AlertHubViewController(title: "Your title", message: "Your message", style: .compact)

let primaryAlertAction = AlertHubAction(title: "Save Changes", style: .primary)
primaryAlertAction.setActionTap({ alertAction, index, identifier in print("Save Changes") })
alertViewController.addAction(primaryAlertAction)

let secondaryAlertAction = AlertHubAction(title: "Cancel", style: .secondary)
secondaryAlertAction.setActionTap({ alertAction, index, identifier in print("Save Changes") })
alertViewController.addAction(secondaryAlertAction)

present(alertViewController, animated: true)
```

You can also use method chaining to create your alert, your alert actions and to add the actions to the alert.

```swift
present(AlertHubViewController(title: title, message: message, style: style)
            .addAction(AlertHubAction(title: "Save Changes", style: .primary)
                .setActionTap({_ in print("Save Changes") }))
            .addAction(AlertHubAction(title: "Close", style: .secondary)
                .setActionTap({_ in print("Close") })),
                animated: true)
```

### Styling

You can create your own styles by creatting instances of AlertHubStyleItem and AlertHubActionStyleItem. Alertatively, you can implement the AlertHubStyling, and AlertHubActionStyling protocols. Then use the appropriate initializers for AlertHubController and AlertHubAction.

```swift
let alertStyle = AlertHubStyleItem(titleColor: textColor,
                                      messageColor: textColor,
                                      backgroundColor: UIColor.white,
                                      borderColor: UIColor.black.withAlphaComponent(0.2),
                                      borderWidth: 1.0,
                                      cornerRadius: 5.0,
                                      shadowColor: UIColor.black,
                                      shadowOffset: CGSize(width: 5.0, height: 5.0),
                                      shadowOpacity: 0.5,
                                      layout: .compact,
                                      loading: false)
let alertViewController = AlertHubViewController(title: "Alert Title", message: "Alert Message", styleItem: alertStyle)

let actionStyle = AlertHubActionStyleItem(titleColor: UIColor.white,
                                           backgroundColor: backgroundColor,
                                           borderColor: UIColor.clear,
                                           borderWidth: 0.0,
                                           cornerRadius: 5.0,
                                           contentInsets: defaultContentInsets)
let alertAction = AlertHubAction(title: "Alert Action Title", styleItem: actionStyle)

```