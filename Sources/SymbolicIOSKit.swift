//
//  SymbolicIOSKit.swift
//  SymbolicIOSKit
//
//  Created by Muhammad Hanif Sugiyanto on 10 May 2019.
//  Copyright © 2019 Extrainteger. All rights reserved.
//

// Include Foundation
@_exported import Foundation

open class SymbolicIOSKit: NSObject {
  
  public typealias Completion = (String?, Error?) -> Void
  
  public let config: SymbolicConfig
  
  private var executing = false
  
  // MARK: - Initialization
  public init(config: SymbolicConfig) {
    self.config = config
  }
  
  
}
