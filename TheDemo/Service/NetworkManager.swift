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
        case .notReachable:
          print("The network is not reachable")

        case .unknown :
          print("It is unknown whether the network is reachable")

        case .reachable(.ethernetOrWiFi):
          print("The network is reachable over the WiFi connection")

        case .reachable(.wwan):
          print("The network is reachable over the WWAN connection")
      }
    }
    // start listening
    reachabilityManager?.startListening()
  }
}
