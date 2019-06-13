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
        let config = SymbolicConfig.init(clientId: "YOUR_CLIENT_ID", authorizeURL: "YOUR_AUTH_URL", responseType: "YOUR_RESPONSE_TYPE", redirectURI: "YOUR_REDIRECT_URI", scope: nil)
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
        web.close()
    }
}
