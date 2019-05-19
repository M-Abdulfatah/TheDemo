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
    contentView.layer.cornerRadius = 20
    contentView.layer.borderWidth = 1.0
    contentView.layer.borderColor = UIColor.clear.cgColor
    contentView.layer.masksToBounds = true
    contentView.backgroundColor = .white

    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize(width: 0, height: 2)
    layer.shadowRadius = 3
    layer.shadowOpacity = 0.15
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    layer.backgroundColor = UIColor.clear.cgColor
  }
}
