//
//  HeroModel.swift
//  desafio-ios-pedro-lopes
//
//  Created by Pedro Lopes on 09/03/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation

struct HeroListResponse: Codable {
    
    let responseData: HeroList
    
    enum CodingKeys: String, CodingKey {
           case responseData = "data"
       }
}

struct HeroList: Codable {
    
    let list: [Hero]
    
    enum CodingKeys: String, CodingKey {
        case list = "results"
    }
}

struct Hero: Codable {
    let name: String
   // let imageData: HeroImage
    
    enum CodingKeys: String, CodingKey {
        case name
        //case imageData = "thumbnail"
    }
}

struct HeroImage: Codable {
    
    let imageUrl: String
    let imageExtension: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "path"
        case imageExtension = "extension"
    }
}
