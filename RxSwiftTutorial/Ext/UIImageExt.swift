//
//  UIImageExt.swift
//  RxSwiftTutorial
//
//  Created by An Nguyen Q. VN.Danang on 08/08/2022.
//  Copyright © 2022 MBA0217. All rights reserved.
//

import UIKit
    
extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
