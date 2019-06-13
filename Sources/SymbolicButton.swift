//
//  SymbolicButton.swift
//  SymbolicIOSKit-iOS
//
//  Created by Hanif Sugiyanto on 13/06/19.
//  Copyright © 2019 Extrainteger. All rights reserved.
//

import UIKit

open class SymbolicButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    func sharedInit() {
        
    }
    
    func refreshLayout() {
        initButton()
    }
    
    func initButton() {
        
    }
    
}
