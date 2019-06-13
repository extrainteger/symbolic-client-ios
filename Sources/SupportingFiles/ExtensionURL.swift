//
//  ExtensionURL.swift
//  SymbolicIOSKit-iOS
//
//  Created by Hanif Sugiyanto on 10/05/19.
//  Copyright © 2019 Extrainteger. All rights reserved.
//

import Foundation

extension URL {
    func getQueryString(parameter: String) -> String? {
        return URLComponents(url: self, resolvingAgainstBaseURL: false)?
            .queryItems?
            .first { $0.name == parameter }?
            .value
    }
}

