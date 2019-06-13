//
//  SafariWebView.swift
//  SymbolicIOSKit-iOS
//
//  Created by Hanif Sugiyanto on 13/05/19.
//  Copyright © 2019 Extrainteger. All rights reserved.
//

import UIKit
import SafariServices

@available(iOS 9, *)
@objc public class SafariWebView: NSObject, WebViewable {
    
    public var animated: Bool
    let viewController: UIViewController
    
    public init(viewController: UIViewController, animated: Bool = true) {
        self.viewController = viewController
        self.animated = animated
    }
    
    public func open(_ url: URL) {
        let webViewController = SFSafariViewController(url: url)
        viewController.present(webViewController, animated: animated, completion: nil)
    }
    
    public func close() {
        DispatchQueue.main.async {
            /// assume must be top most presented
            self.viewController.dismiss(animated: true, completion: nil)
        }
    }
}
