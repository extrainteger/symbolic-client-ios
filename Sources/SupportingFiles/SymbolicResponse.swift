//
//  SymbolicResponse.swift
//  SymbolicIOSKit-iOS
//
//  Created by Hanif Sugiyanto on 13/05/19.
//  Copyright © 2019 Extrainteger. All rights reserved.
//

import Foundation

public struct SymbolicResponses: Codable {
    public var accessToken: String
    public var tokenType: String
    public var refreshToken: String
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case refreshToken = "refresh_token"
    }
}
