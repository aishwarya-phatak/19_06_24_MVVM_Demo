//
//  ProductViewModel.swift
//  19_06_24_MVVM_Demo
//
//  Created by Vishal Jagtap on 05/09/24.
//

import Foundation

final class ProductViewModel{
    var products : [Product] = []
    var eventHandler : ((_ event : Event)->Void)?
    
    func fetchProducts(){
        APIManager.shared.fetchProducts { response in
            self.eventHandler!(.stopLoading)
            switch response{
                 case .success(let products):
                    self.products = products
                    self.eventHandler!(.dataLoaded)
                 case .failure(let error):
                    print(error)
                self.eventHandler!(.error(DataError.invalidResponse))
            }
        }
    }
}

extension ProductViewModel{
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
