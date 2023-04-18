//
//  ProductDetailViewController.swift
//  FoodApp
//
//  Created by Diana Pava Avila on 10/04/23.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let idDetailCell = "productDetailCell"
    var productsSelected: [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibDetailcell = UINib(nibName: "ProductDetailTableViewCell", bundle: nil)
        tableView.register(nibDetailcell, forCellReuseIdentifier: idDetailCell)
        tableView.dataSource = self
    }
    
}
extension ProductDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsSelected.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idDetailCell, for: indexPath) as?
                ProductDetailTableViewCell else {
            return UITableViewCell()
        }
        cell.setData(data: productsSelected[indexPath.row])
        return cell
    }
    
    
    
}

