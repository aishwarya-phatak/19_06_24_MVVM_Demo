//
//  ProductListViewController.swift
//  19_06_24_MVVM_Demo
//
//  Created by Vishal Jagtap on 05/09/24.
//

import UIKit

class ProductListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var productTableView: UITableView!
    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        registerXIBWithCell()
        observeEvent()
    }
    
    func registerXIBWithCell(){
        productTableView.dataSource = self
        productTableView.delegate = self
        
        let uiNib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.productTableView.register(uiNib, forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
    }
    
    func observeEvent(){
        viewModel.eventHandler = { [weak self]
            event in
            
            switch event{
                case .loading :
                    print("Product Data Loading")
                case .stopLoading :
                    print("Stop Loading")
                case .dataLoaded :
                    print("Products Data Loaded")
                    DispatchQueue.main.async {
                        self!.productTableView.reloadData()
                    }
                case .error(let error):
                    print("error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productTableViewCell = self.productTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        productTableViewCell.product = viewModel.products[indexPath.row]
        return productTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115.0
    }
}
