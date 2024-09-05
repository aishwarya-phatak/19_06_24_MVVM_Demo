//
//  APIManager.swift
//  19_06_24_MVVM_Demo
//
//  Created by Vishal Jagtap on 04/09/24.
//

import Foundation

enum DataError : Error{
    case invalidURL
    case invalidResponse
    case invalidDecoding
    case network(Error?)
}

//Result enum is having two cases Success and Failure
typealias Handler = (Result<[Product],DataError>)->Void

//block inheritance heirarchy by uisng final keyword
final class APIManager{
    
    static let shared = APIManager()  //create a property which is static and constant which is referring to object of API Manager
    
    private init(){} //when init block is private object cannot be created
    
    func fetchProducts(completionHandler : @escaping Handler){
        guard let url = URL(string: Constant.API.productURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            do{
                let products = try JSONDecoder().decode([Product].self, from: data!)
                completionHandler(.success(products))
            }catch{
                completionHandler(.failure(error as! DataError))
            }
        }
    }
}
