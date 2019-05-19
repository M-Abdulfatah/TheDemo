//
//  NetworkManager.swift
//  TheDemo
//
//  Created by Mahmoud Mohammed on 5/19/19.
//  Copyright © 2019 TheD. All rights reserved.
//

import Alamofire

var isConnected: Bool {
  return NetworkReachabilityManager()?.isReachable ?? false
}

class NetworkManager {
  //shared instance
  static let shared = NetworkManager()

  let reachabilityManager = NetworkReachabilityManager(host: "google.com")

  var listners: [NetworkReachabilityManager.Listener] = []

  func startNetworkReachabilityObserver() {
    reachabilityManager?.listener = {[weak self] status in

      self?.listners.forEach { $0(status) }

      switch status {
        case .notReachable, .unknown:
          print("The network is not reachable")
          NotificationCenter.default.post(name: .notReachable, object: nil)
        case .reachable:
          print("The network is reachable")
          NotificationCenter.default.post(name: .reachable, object: nil)
      }
    }
    // start listening
    reachabilityManager?.startListening()
  }
}
