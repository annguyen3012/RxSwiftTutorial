//
//  DelegateProxyDemoViewController.swift
//  RxSwiftTutorial
//
//  Created by An Nguyen Q. VN.Danang on 11/08/2022.
//  Copyright © 2022 MBA0217. All rights reserved.
//

import UIKit
import RxCocoa
import WebKit
import RxSwift

class WKNavigationDelegateProxy: DelegateProxy<WKWebView, WKNavigationDelegate>, WKNavigationDelegate, DelegateProxyType {
    // Type parent object
    weak private (set) var webView: WKWebView?

    // parameter webview: Parent object for delegate proxy
    init(webView: ParentObject) {
        self.webView = webView
        super.init(parentObject: webView, delegateProxy: RxWKNavigationDelegateProxy.self)
    }

    // Register Factory method
    static func registerKnownImplementations() {
        self.register { WKNavigationDelegateProxy(webView: $0) }
    }

    // Getter for delegate proxy
    static func currentDelegate(for object: WKWebView) -> WKNavigationDelegate? {
        return object.navigationDelegate
    }

    // Setter for delegate proxy
    static func setCurrentDelegate(_ delegate: WKNavigationDelegate?, to object: WKWebView) {
        object.navigationDelegate = delegate
    }
}

extension Reactive where Base: WKWebView {
//    var delegate: DelegateProxy<WKWebView, WKNavigationDelegate> {
//        RxWKNavigationDelegateProxy.proxy(for: base)
//    }
//
//    func castOrThrow<T>(resultType: T.Type, object: Any) throws -> T {
//        guard let returnValue = object as? T else {
//            throw RxCocoaError.castingError(object: object, targetType: resultType)
//        }
//        return returnValue
//    }
//
//    var didCommit: Observable<WKNavigation> {
//        delegate.methodInvoked(#selector(WKNavigationDelegate.webView(_:didCommit:)))
//            .map { try castOrThrow(resultType: WKNavigation.self, object: $0[1]) }
//    }
//
//    var didStartLoad: Observable<WKNavigation> {
//        delegate.methodInvoked(#selector(WKNavigationDelegate.webView(_:didStartProvisionalNavigation:)))
//            .map { try castOrThrow(resultType: WKNavigation.self, object: $0[1])}
//    }
//
//    var didFinish: Observable<WKNavigation> {
//        delegate.methodInvoked(#selector(WKNavigationDelegate.webView(_:didFinish:)))
//            .map { try castOrThrow(resultType: WKNavigation.self, object: $0[1]) }
//    }
//
//    var didFail: Observable<(WKNavigation, Error)> {
//        delegate.methodInvoked(#selector(WKNavigationDelegate.webView(_:didFail:withError:)))
//            .map { (try castOrThrow(resultType: WKNavigation.self, object: $0[1]), try castOrThrow(resultType: Error.self, object: $0[2])) }
//    }
    
    // Delegate Forward
    public func setDelegate(_ delegate: WKNavigationDelegate) -> Disposable {
        return WKNavigationDelegateProxy.installForwardDelegate(delegate, retainDelegate: false, onProxyForObject: self.base)
    }
}

class DelegateProxyDemoViewController: UIViewController {
    @IBOutlet private weak var webView: WKWebView!
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Delegate Proxy"
//        webView.navigationDelegate = self
//        setupWebViewBinding()
        webView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        let urlRequest = URLRequest(url: URL(string: "https://www.google.com/")!)
        webView.load(urlRequest)
        
    }
    
//    private func setupWebViewBinding() {
//        webView.rx.didCommit
//            .subscribe(onNext: { wkNavigation in
//                print("LOG + didCommit")
//            })
//            .disposed(by: disposeBag)
//
//        webView.rx.didStartLoad
//            .subscribe(onNext: { wkNavigation in
//                print("LOG + didStartLoad")
//            })
//            .disposed(by: disposeBag)
//
//        webView.rx.didFinishLoad
//            .subscribe(onNext: { wkNavigation in
//                print("LOG + didFinishLoad")
//            })
//            .disposed(by: disposeBag)
//
//        webView.rx.didFailLoad
//            .subscribe(onNext: { wkNavigation, error in
//                print("LOG + didFailLoad")
//            })
//            .disposed(by: disposeBag)
//    }
}

extension DelegateProxyDemoViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("LOG + didFinishLoad")
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("LOG + didFailLoad")
    }

    // Invoked when a main frame navigation starts.
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("LOG + didStartLoad")
    }

    // Invoked when content starts arriving for the main frame
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("LOG + didCommit")
    }
}
