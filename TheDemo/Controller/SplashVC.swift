//
//  SplashVC.swift
//  TheDemo
//
//  Created by Mahmoud Mohammed on 5/20/19.
//  Copyright © 2019 TheD. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

  // MARK: - IBOutlets
  @IBOutlet private weak var bgImageView: UIImageView!
  @IBOutlet private weak var logoImageView: UIImageView!

  // MARK: - LifeCycle Methods
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    _ = Timer.scheduledTimer(
      timeInterval: 1,
      target: self,
      selector: #selector(animateLogo),
      userInfo: nil,
      repeats: false)
  }

  // MARK: - Helper Methods
  @objc
  private func animateLogo() {
    UIView.animate(
      withDuration: 1,
      animations: {
        self.logoImageView.alpha = 0
      }, completion: { _ in
      self.showHomePage()
      })
  }

  private func showHomePage() {
    (UIApplication.shared.delegate as! AppDelegate).reload()
  }
}
