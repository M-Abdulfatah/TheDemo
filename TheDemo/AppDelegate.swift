//
//  AppDelegate.swift
//  TheDemo
//
//  Created by Mahmoud Mohammed on 5/18/19.
//  Copyright © 2019 TheD. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  // swiftlint:disable next line_length
  // swiftlint:disable next discouraged_optional_collection
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    setupMainColorScheme()
    return true
  }

  private func setupMainColorScheme() {
    UINavigationBar.appearance().barTintColor = Colors.primary.color
    UINavigationBar.appearance().tintColor = .white
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().prefersLargeTitles = true
    UINavigationBar.appearance().isTranslucent = false
  }
}
