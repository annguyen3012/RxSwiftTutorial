//
//  HomeViewController.swift
//  RxSwiftTutorial
//
//  Created by An Nguyen Q. VN.Danang on 04/08/2022.
//  Copyright © 2022 MBA0217. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var changeButton: UIButton!
    @IBOutlet private weak var goToDetailButton: UIButton!
    @IBOutlet private weak var delegateProxyButton: UIButton!
    
    // MARK: - Properties
    let viewModel = HomeViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewModel.disposedRelaySubject()
    }
    
    // MARK: - Private functions
    private func setupBinding() {
        
        viewModel.textRelaySubject
            .bind(to: contentLabel.rx.text)
            .disposed(by: viewModel.disposeBag)
        
        viewModel.textRelaySubject
            .bind(to: self.rx.naviTitle)
            .disposed(by: viewModel.disposeBag)
        
        changeButton.rx.tap
            .bind(to: viewModel.changeRelaySubject)
            .disposed(by: viewModel.disposeBag)
        
        inputTextField.rx.text.orEmpty
            .bind(to: viewModel.textFieldRelaySubject)
            .disposed(by: viewModel.disposeBag)
        
        inputTextField.rx.text.orEmpty
            .map { !$0.isEmpty }
            .bind(to: changeButton.rx.enableButton)
            .disposed(by: viewModel.disposeBag)

//        inputTextField.rx.controlEvent(.editingChanged)
//            .map { self.inputTextField.text ?? "" }
//            .filter { !$0.isEmpty }
//            .bind(to: viewModel.textFieldRelaySubject)
//            .disposed(by: viewModel.disposeBag)

        
        viewModel.setupBinding()
        
        goToDetailButton.rx.tap
            .subscribe { _ in
                let vc = MusicListViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            } onError: { error in
                print(error.localizedDescription)
            } onCompleted: {
                print("completed")
            } onDisposed: {
                print("disposed")
            }
            .disposed(by: viewModel.disposeBag)
        
        delegateProxyButton.rx.tap
            .subscribe(onNext: { _ in
                self.navigationController?.pushViewController(DelegateProxyDemoViewController(), animated: true)
            })
            .disposed(by: viewModel.disposeBag)
    }
}

extension Reactive where Base: UIViewController {
    var naviTitle: Binder<String> {
        return Binder(self.base) { vc, value in
            vc.title = value
        }
    }
}

extension Reactive where Base: UIButton {
    var enableButton: Binder<Bool> {
        return Binder(self.base) { btn, value in
            btn.isEnabled = value
            btn.backgroundColor = value ? .blue : .cyan
            btn.alpha = value ? 1 : 0.7
        }
    }
}

// MARK: - Custome or create Binder
//extension Reactive where Base: UILabel {
//    var text: Binder<String> {
//        return Binder(self.base) { label, text in
//            if text.isEmpty { return }
//            label.text = "\(text) say hello"
//        }
//    }
//}

//extension Reactive where Base: UITextField {
//    var text: ControlProperty<String?> {
//        return controlProperty(editingEvents: .editingChanged) { tf in
//            guard let value = tf.text else { return "" }
//            return value + " hello World"
//        } setter: { tf, val  in
//        }
//    }
//}
