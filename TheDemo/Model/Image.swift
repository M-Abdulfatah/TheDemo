//
//  Image.swift
//  TheDemo
//
//  Created by Mahmoud Mohammed on 5/19/19.
//  Copyright © 2019 TheD. All rights reserved.
//

import UIKit

struct Image: Codable {
  let link: String
  let height, width: String
  var imageSize: CGSize {
    guard
      let imageWidthNum = NumberFormatter().number(from: width),
      let imageHeightNum = NumberFormatter().number(from: height)
      else {
        return CGSize(width: 150, height: 300)
    }
    let imageWidth = CGFloat(truncating: imageWidthNum)
    let imageHeight = CGFloat(truncating: imageHeightNum)
    return CGSize(width: imageWidth, height: imageHeight)
  }
}
