//
//  CarouselTableViewCell.swift
//  FoodApp
//
//  Created by Diana Pava Avila on 27/03/23.
//

import UIKit

protocol CarouselTableViewCellDelegate: AnyObject {
    func touch(name: Product)
}

class CarouselTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    private let identifier = "productCollectionCell"
    private var products: [Product] = []
    var delegate: CarouselTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func set(data: [Product]){
        self.products = data
        collectionView.reloadData()
    }
}

extension CarouselTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? ProductCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        cell.closure = { name in
            self.delegate?.touch(name: name)
        }
        
        cell.setData(data: products[indexPath.row])
        return cell
    }
    
    
}
