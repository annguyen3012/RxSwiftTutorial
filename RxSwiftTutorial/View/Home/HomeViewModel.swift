//
//  HomeViewModel.swift
//  RxSwiftTutorial
//
//  Created by An Nguyen Q. VN.Danang on 04/08/2022.
//  Copyright © 2022 MBA0217. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift

final class HomeViewModel {
    // MARK: - Properties
    let textRelaySubject: BehaviorRelay<String> = .init(value: "")
    let changeRelaySubject: PublishRelay<Void> = .init()
    let textFieldRelaySubject: BehaviorRelay<String> = .init(value: "")
    var disposeBag: DisposeBag = DisposeBag()

    
    // MARK: - Functions
    func setupBinding() {
        changeRelaySubject
            .subscribe { _ in
                print("tap")
                self.textFieldRelaySubject
                    .subscribe { event in
                        print(event.element)
                        if event.element?.isEmpty ?? false { return }
                        self.textRelaySubject.accept(event.element?.trimmingCharacters(in: .whitespaces) ?? "")
                    }
                    .dispose()
            } onError: { error in
                print(error.localizedDescription)
            } onCompleted: {
                print("completed")
            } onDisposed: {
                print("disposed")
            }
            .disposed(by: disposeBag)
        
        textRelaySubject
            .subscribe { event in
                print(event)
            }
            .disposed(by: disposeBag)
    }
    
    func disposedRelaySubject() {
    }
    
}
