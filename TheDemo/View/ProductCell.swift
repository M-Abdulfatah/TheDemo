//
//  ProductCell.swift
//  TheDemo
//
//  Created by Mahmoud Mohammed on 5/19/19.
//  Copyright © 2019 TheD. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {

  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var priceLabel: UILabel!
  @IBOutlet private weak var productImageView: UIImageView!

  override func layoutSubviews() {
    super.layoutSubviews()
    setupViews()
  }

  func setupViews(withProduct product: Product) {
    titleLabel.text = product.name
    priceLabel.text = "\(product.price)$"
    productImageView.loadImageFromURLString(product.image.link)
  }

  private func setupViews() {
    contentView.layer.cornerRadius = 10
    contentView.layer.masksToBounds = true
    contentView.backgroundColor = Colors.secondary.color
  }
}
