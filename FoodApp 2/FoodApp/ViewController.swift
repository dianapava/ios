//
//  ViewController.swift
//  FoodApp
//
//  Created by Diana Pava Avila on 27/03/23.
//

import UIKit

struct Product{
    let image: String
    let price: Double
    let name: String
    let quant: Int
}

class ViewController: UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private var products: [Product] = []
    private var newProductList: [Product] = []
    private var productSelecteds: [Product] = []
    private let idCarouselCell = "carouselCell"
    private let idProductCell = "productTableCell"
    override func viewDidLoad() {
        super.viewDidLoad()
       let nibCarousel = UINib(nibName: "CarouselTableViewCell", bundle: nil)
        tableView.register(nibCarousel, forCellReuseIdentifier: idCarouselCell)
        let nibProduct = UINib(nibName: "ProductTableViewCell", bundle: nil)
        tableView.register(nibProduct, forCellReuseIdentifier: idProductCell)
        tableView.dataSource = self
        searchBar.delegate = self

        fillData()
    }
   
    func fillData(){
        products = [
            Product(image: "burger", price: 13500, name: "Hamburguesa", quant: 0),
            Product(image: "arepa", price: 10200, name: "Arepa Rellena", quant: 0),
            Product(image: "fries", price: 9500, name: "Salchipapa", quant: 0),
            Product(image: "hotdog", price: 12500, name: "Perro Caliente", quant: 0),
            Product(image: "salad", price: 14500, name: "Ensalada Cesar",quant: 0)]
        newProductList = products
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ProductDetailViewController,
        let products = sender as? [Product] else { return }
        vc.productsSelected = products
    }
    
    @IBAction func onCreateOrder(_ sender: Any) {
        self.performSegue(withIdentifier: "detailProduct", sender: productSelecteds)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        switch section{
            case 0:
                return "Populares"
            case 1:
                return "Productos"
            default:
                return ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 1 : products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: idCarouselCell,for:indexPath) as? CarouselTableViewCell else {
                return UITableViewCell()
            }
            cell.set(data: products)
            cell.delegate = self
            return cell
        } else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: idProductCell, for: indexPath) as? ProductTableViewCell else{
                return UITableViewCell()
            }
            cell.setData(data: products[indexPath.row])
            cell.closureDos = { product in
               
                self.productSelecteds.append(product)
            }
            return cell
        }
        
    }
    
}


extension ViewController: UISearchBarDelegate {
 
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {return }
        let filter = newProductList.filter { product in
            product.name.contains(searchText)
        }
        
        products = filter
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        products = newProductList
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
}

extension ViewController: CarouselTableViewCellDelegate {
    func touch(name: Product) {
        self.productSelecteds.append(name)
        view.backgroundColor = name.name.lowercased() == "hamburguesa" ? .red : .blue
    }
}
