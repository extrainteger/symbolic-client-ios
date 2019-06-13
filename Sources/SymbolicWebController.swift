//
//  SymbolicWebController.swift
//  SymbolicIOSKit-iOS
//
//  Created by Hanif Sugiyanto on 10/05/19.
//  Copyright © 2019 Extrainteger. All rights reserved.
//

import UIKit
import WebKit

public protocol ISymbolicWebDelegate {
    func getCodeQueryString(code: String)
}

public class SymbolicWebController: UIViewController {
    
    public var delegate: ISymbolicWebDelegate?
    // MARK: - Private properties
    private lazy var wkwebView: WKWebView = {
        let wkWebView = WKWebView()
        return wkWebView
    }()
    private let progressView: UIProgressView = {
       let view = UIProgressView(progressViewStyle: .default)
        view.progressTintColor = UIColor.oiSea
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    /// Retain cylce
    deinit {
        wkwebView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    // MARK: - LoadView
    open override func loadView() {
        wkwebView.addObserver(self,
                              forKeyPath: #keyPath(WKWebView.estimatedProgress),
                              options: .new,
                              context: nil)
    }
    // MARK: - Observe value
    open override func observeValue(forKeyPath keyPath: String?,
                                    of object: Any?,
                                    change: [NSKeyValueChangeKey : Any]?,
                                    context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(wkwebView.estimatedProgress)
        }
    }
    // MARK: - ViewDidLoad
    open override func viewDidLoad() {
        /// assign view
        view = wkwebView
        /// assign delegate
        wkwebView.navigationDelegate = self
        /// setup progressView
        setupProgressView()
    
    }
    /// MARK: - Setup load web using symbolic config
    public func load(_ config: SymbolicConfig) {
        wkwebView.load(URLRequest(url: config.getURL()))
    }
    
    public func close() {
        if isModal() == true {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func setupProgressView() {
        // configure progressview
        [progressView].forEach { self.view.addSubview($0) }
        progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        if #available(iOS 11.0, *) {
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            progressView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        }
        progressView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    // MARK: - Decisions for WKWebView
    public func webView(_ webView: WKWebView,
                        decidePolicyFor navigationAction: WKNavigationAction,
                        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let code = navigationAction.request.url?.getQueryString(parameter: "code") {
            delegate?.getCodeQueryString(code: code)
        }
        decisionHandler(.allow)
    }
}
// MARK: - Extension WKNavigationDelegate
extension SymbolicWebController: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.hideProgressView()
    }
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.hideProgressView()
    }
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.showProgressView()
    }
}
// MARK: - Extensions for Animatng progress view
extension SymbolicWebController {
    private func showProgressView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.progressView.alpha = 1
        }, completion: nil)
    }
    
    private func hideProgressView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.progressView.alpha = 0
        }, completion: nil)
    }
    private func isModal() -> Bool {
        return self.presentingViewController?.presentedViewController == self
            || (self.navigationController != nil && self.navigationController?.presentingViewController?.presentedViewController == self.navigationController)
            || self.tabBarController?.presentingViewController is UITabBarController
    }
}
