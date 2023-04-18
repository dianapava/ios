//
//  ProductDetailTableViewCell.swift
//  FoodApp
//
//  Created by Diana Pava Avila on 11/04/23.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var quanProductCell: UILabel!
    @IBOutlet weak var priceTableCell: UILabel!
    @IBOutlet weak var productTableCell: UILabel!
    @IBOutlet weak var imageTableCell: UIImageView!
  
    func setData(data: Product){
        quanProductCell.text = String(data.quant)
        priceTableCell.text = String(data.price)
        productTableCell.text = data.name
        imageTableCell.image = UIImage(named: (data.image))
    }

}

