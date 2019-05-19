//
//  ProductsVC.swift
//  TheDemo
//
//  Created by Mahmoud Mohammed on 5/18/19.
//  Copyright © 2019 TheD. All rights reserved.
//

import Alamofire
import UIKit

class ProductsVC: UIViewController {

  // MARK: - Properties
  let cellID = "cellID"
  var products: [Product] = []
  let refresher = UIRefreshControl()
  var activeRequest: DataRequest?

  // MARK: - IBOutlets
  @IBOutlet private weak var collectionView: UICollectionView!

  // MARK: - Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    loadData()
  }

  // MARK: - Helpers Methods
  private func setupViews() {
    title = "the D.emo"
    let producCell = UINib(nibName: "ProductCell", bundle: nil)
    collectionView.register(producCell, forCellWithReuseIdentifier: cellID)
    collectionView.delegate = self
    collectionView.dataSource = self
    refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
    collectionView.refreshControl = refresher
  }

  @objc
  private func loadData() {
    collectionView.refreshControl?.beginRefreshing()
    activeRequest?.cancel()
    activeRequest = AF.request(APIRouter.getProducts(forceLoad: isConnected))
      .responseDecodable { [unowned self] (response: DataResponse<ProductResponse>) in
        defer { self.collectionView.refreshControl?.endRefreshing() }
        switch response.result {
          case .failure(let err):
            print(err)
          case .success(let model):
            self.products = model.data
            self.collectionView.reloadData()
        }
      }
  }
}

// MARK: - UICollectionView Delegate
extension ProductsVC: UICollectionViewDelegateFlowLayout {
  // swiftlint:disable next line_length
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    // calculate item height dynamically based on the image height
    let itemWidth = collectionView.frame.width - 32 // 32 for the item padding
    let imageWidth = products[indexPath.row].image.imageSize.width
    let imageHeight = products[indexPath.row].image.imageSize.height
    let scaleFactor = itemWidth / imageWidth
    let newImageHeight = imageHeight * scaleFactor
    let newItemHeight = newImageHeight + 95 // 75 title label height and 20 padding top
    return CGSize(width: itemWidth, height: newItemHeight)
  }

  // swiftlint:disable next line_length
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 30
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let detailsVC = StoryboardScene.Main.productDetailsVC.instantiate()
    detailsVC.product = products[indexPath.row]
    navigationController?.pushViewController(detailsVC, animated: true)
  }
}

// MARK: - UICollectionView DataSource
extension ProductsVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return products.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? ProductCell
      else {
      return UICollectionViewCell()
    }
    cell.setupViews(withProduct: products[indexPath.row])
    return cell
  }
}
