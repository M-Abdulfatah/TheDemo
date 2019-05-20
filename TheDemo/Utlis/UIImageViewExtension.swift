//
//  UIImageViewExtension.swift
//  TheDemo
//
//  Created by Mahmoud Mohammed on 5/19/19.
//  Copyright © 2019 TheD. All rights reserved.
//

import Kingfisher
import UIKit

extension UIImageView {
  func loadImageFromURLString(_ urlString: String) {
    if let url = URL(string: urlString) {
      self.kf.indicatorType = .activity
      self.kf.setImage(with: url, options: [.transition(.fade(0.2))])
    }
  }
}
