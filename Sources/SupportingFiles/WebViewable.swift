//
//  WebViewable.swift
//  SymbolicIOSKit-iOS
//
//  Created by Hanif Sugiyanto on 13/05/19.
//  Copyright © 2019 Extrainteger. All rights reserved.
//

import Foundation

@objc public protocol WebViewable {
    func open(_ URL: URL)
    @objc optional func close()
}
