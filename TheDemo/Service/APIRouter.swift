//
//  APIRouter.swift
//  TheDemo
//
//  Created by Mahmoud Mohammed on 5/19/19.
//  Copyright © 2019 TheD. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
  static let baseURL = URL(string: "https://limitless-forest-98976.herokuapp.com/")!

  case getProducts(forceLoad: Bool)

  var method: HTTPMethod {
    switch self {
      case .getProducts: return .get
    }
  }

  var path: URL {
    let base = APIRouter.baseURL
    switch self {
    // We append to the path here if we had to. For Example: base.appendingPathComponent("/example")
      case .getProducts: return base
    }
  }

  var cachePolicy: URLRequest.CachePolicy {
    switch self {
      case .getProducts(let forceLoad):
        return forceLoad ? .reloadIgnoringLocalAndRemoteCacheData : .returnCacheDataElseLoad
    }
  }

  func asURLRequest() throws -> URLRequest {
    var urlRequest = URLRequest(url: path)
    urlRequest.httpMethod = method.rawValue
    urlRequest.cachePolicy = cachePolicy
    return urlRequest
  }
}
