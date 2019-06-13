//
//  SymbolicConfig.swift
//  SymbolicIOSKit-iOS
//
//  Created by Hanif Sugiyanto on 10/05/19.
//  Copyright © 2019 Extrainteger. All rights reserved.
//

import Foundation
@objc open class SymbolicConfig: NSObject {
    
    // MARK: Private properties
    open var clientId: String
    open var authorizeURL: String?
    open var responseType: String
    open var redirectURI: String?
    open var scope: String?
    
    // MARK: - Initializations
    /**
     Initialization configuration for Authorization
     - parameters:
     - clientId: Defines generated Client ID
     - authorizeURL: Defines authorization URL
     - changePasswordURL: Defines authorization URL
     - responseType: Defines response_type, for default is code
     - redirectURI: Defines redirect URI
     - scope: defines scope area
     */
    public init(clientId: String,
                authorizeURL: String? = nil,
                responseType: String = "code",
                redirectURI: String? = nil,
                scope: String? = nil) {
        self.clientId = clientId
        self.authorizeURL = authorizeURL
        self.responseType = responseType
        self.redirectURI = redirectURI
        self.scope = scope
    }
    // MARK: - GET URL function
    open func getURL() -> URL {
        return URL(string: "\(authorizeURL ?? "")?client_id=\(clientId)&response_type=\(responseType)&redirect_uri=\(redirectURI ?? "")&scope=\(scope ?? "")")!
    }
}
