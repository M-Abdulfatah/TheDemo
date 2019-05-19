//
//  ProductResponse.swift
//  TheDemo
//
//  Created by Mahmoud Mohammed on 5/19/19.
//  Copyright © 2019 TheD. All rights reserved.
//

import Foundation

struct ProductResponse: Codable {
  let data: [Product]
  let count: Int
}
