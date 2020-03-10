//
//  HeroListAPIWorker.swift
//  desafio-ios-pedro-lopes
//
//  Created by Pedro Lopes on 09/03/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation
import Alamofire

class HeroListAPIWorker {
    
    public func getHeroList(successBlock: @escaping (HeroList) -> Void,
                            errorBlock: @escaping (String) -> Void) {
        
        let currentTimeStamp = String(Date().timeIntervalSince1970)
        let hash = (currentTimeStamp + Constants.APIPrivateKey + Constants.APIPublicKey).md5Hash()

        let params = ["apikey": Constants.APIPublicKey,
                      "ts": currentTimeStamp,
                      "hash": hash,
                      "limit": "20"]
        
        let request = AF.request("https://gateway.marvel.com/v1/public/characters", parameters: params)
        request.responseDecodable(of: HeroListResponse.self) { (response) in
            
            switch response.result{
                case .success(let responseData):
                    successBlock(responseData.responseData)
                
                case .failure(let error):
                    if let errDescription = error.errorDescription {
                        errorBlock(errDescription)
                    } else {
                        errorBlock("Erro ao solicitar lista de herois")
                    }
            }
        }
    }
}
