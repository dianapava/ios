//
//  ProductTableViewCell.swift
//  FoodApp
//
//  Created by Diana Pava Avila on 27/03/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    var products: [Product] = []
    private var product: Product?
    var closureDos: ((Product) -> Void)!
    
    func setData(data: Product){
        product = data
        priceLabel.text = String(data.price)
        nameProductLabel.text = (data.name)
        productImage.image = UIImage(named: (data.image))
    }
    
    @IBAction func onAdd(_ sender: Any) {
        guard let product = product else { return }
        closureDos(product)
    }
}
    
    
