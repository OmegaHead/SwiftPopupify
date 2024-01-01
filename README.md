# SwiftPopupify

[![CI Status](https://img.shields.io/travis/OmegaHead/SwiftPopupify.svg?style=flat)](https://travis-ci.org/OmegaHead/SwiftPopupify)
[![Version](https://img.shields.io/cocoapods/v/SwiftPopupify.svg?style=flat)](https://cocoapods.org/pods/SwiftPopupify)
[![License](https://img.shields.io/cocoapods/l/SwiftPopupify.svg?style=flat)](https://cocoapods.org/pods/SwiftPopupify)
[![Platform](https://img.shields.io/cocoapods/p/SwiftPopupify.svg?style=flat)](https://cocoapods.org/pods/SwiftPopupify)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![Effect](https://github.com/OmegaHead/SwiftPopupify/blob/main/example.gif)

## Usage

To use the pod create a UIPopupViewController object by providing your custom view and present it from your view controller with **animated: false**.
```swift
let myView = UIView()
let popupViewController = UIPopupViewController(mainView: myView)
present(customPopupViewController, animated: false, completion: nil)
```

## Installation

SwiftPopupify is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftPopupify'
```

## Author

OmegaHead, mishachupa2015@outlook.com

## License

SwiftPopupify is available under the MIT license. See the LICENSE file for more info.
