//
//  ItemCollectionViewCell.swift
//  Module10
//
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var backgroundColoredViews: [UILabel]!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var promopriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    
    override func awakeFromNib() {
      super.awakeFromNib()
        for view in backgroundColoredViews {
          view.backgroundColor = .clear
        }
    }
}
