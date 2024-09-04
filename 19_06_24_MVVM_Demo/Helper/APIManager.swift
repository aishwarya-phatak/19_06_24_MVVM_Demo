//
//  APIManager.swift
//  19_06_24_MVVM_Demo
//
//  Created by Vishal Jagtap on 04/09/24.
//

import Foundation

//block inheritance heirarchy by uisng final keyword
final class APIManager{
    
    static let shared = APIManager()  //create a property which is static and constant which is referring to object of API Manager
    
    
    private init(){} //when init block is private object cannot be created
}
