//
//  Product.swift
//  19_06_24_MVVM_Demo
//
//  Created by Vishal Jagtap on 04/09/24.
//

import Foundation
struct Product{
    var id : Int
    var title : String
    var price : Double
    var description : String
    var category : String
    var image : String
    var rating : Rating
}

struct Rating{
    var rate : Double
    var count : Int
}
