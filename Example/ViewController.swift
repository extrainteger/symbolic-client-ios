//
//  ViewController.swift
//  Example
//
//  Created by Muhammad Hanif Sugiyanto on 10 May 2019.
//  Copyright © 2019 Extrainteger. All rights reserved.
//

import UIKit
import SymbolicIOSKit

// MARK: - ViewController

/// The ViewController
class ViewController: UIViewController {

    // MARK: Properties
    
    /// The Label
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "🚀\nSymbolicIOSKit\nExample"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    private let web = SymbolicWebController()
    // MARK: View-Lifecycle
    
    /// View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openSymbolic))
    
    
        
    }
    
    @objc private func openSymbolic() {
        let config = SymbolicConfig.init(clientId: "9d3ecddc52be82088e15ca77d61e504792ef078e96eff64674bf910839675a17", authorizeURL: "https://identitas.extrainteger.com/oauth/authorize", responseType: "code", redirectURI: "extrainteger.opinium://oauth", scope: nil)
        web.load(config)
        web.delegate = self
        navigationController?.pushViewController(web, animated: true)
    }
    
    /// LoadView
    override func loadView() {
        self.view = self.label
    }

}

extension ViewController: ISymbolicWebDelegate {
    func getCodeQueryString(code: String) {
        print("CODE: \(code)")
        web.close()
    }
}
