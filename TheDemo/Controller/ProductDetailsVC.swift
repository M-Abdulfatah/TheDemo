//
//  ProductDetailsVC.swift
//  TheDemo
//
//  Created by Mahmoud Mohammed on 5/19/19.
//  Copyright © 2019 TheD. All rights reserved.
//

import UIKit

class ProductDetailsVC: UIViewController {

  // MARK: - Properties
  var product: Product!

  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var priceLabel: UILabel!
  @IBOutlet private weak var descriptionTxtView: UITextView!
  @IBOutlet private weak var productImageView: UIImageView!
  @IBOutlet private weak var imageHeightConstraint: NSLayoutConstraint!

  // MARK: - Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  // MARK: - Helpers Methods
  private func setupViews() {
    titleLabel.text = product.name
    priceLabel.text = "\(product.price)$"
    productImageView.loadImageFromURLString(product.image.link)
    descriptionTxtView.text = product.productDescription
    let scaleFactor = productImageView.frame.width / product.image.imageSize.width
    imageHeightConstraint.constant = product.image.imageSize.height * scaleFactor
  }

}
