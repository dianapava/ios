//
//  ProductCollectionViewCell.swift
//  FoodApp
//
//  Created by Diana Pava Avila on 27/03/23.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var priceProductLabel: UILabel!
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var productImageViewCell: UIImageView!
    
    
    var closure: ((Product) -> Void)!
    private var product: Product?
    func setData(data: Product){
        product = data
        priceProductLabel.text = String(data.price)
        nameProductLabel.text = (data.name)
        productImageViewCell.image = UIImage(named: (data.image))
    }
        
    @IBAction func OnAdd(_ sender: Any) {
        guard let product = product else { return }
        closure(product)
    }
}

