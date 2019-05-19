//
//  Product.swift
//  TheDemo
//
//  Created by Mahmoud Mohammed on 5/19/19.
//  Copyright © 2019 TheD. All rights reserved.
//

import Foundation

struct Product: Codable {
  let id: Int
  let name, productDescription: String
  let image: Image
  let price: Int
}
