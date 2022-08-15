//
//  DelegateForwardViewController.swift
//  RxSwiftTutorial
//
//  Created by An Nguyen Q. VN.Danang on 15/08/2022.
//  Copyright © 2022 MBA0217. All rights reserved.
//

import UIKit

class DelegateForwardViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.rx.contentOffset.subscribe { val in
            self.scrollView.contentOffset = val
        }

    }

}
