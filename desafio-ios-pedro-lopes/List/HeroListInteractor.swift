//
//  HeroListInteractor.swift
//  desafio-ios-pedro-lopes
//
//  Created by Pedro Lopes on 09/03/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation

protocol HeroListInteractorProtocol {
    func fetchHeroList()
}

class HeroListInteractor: HeroListInteractorProtocol {
    
    let heroListAPIWorker = HeroListAPIWorker()
    
    func fetchHeroList() {
        self.heroListAPIWorker.getHeroList(successBlock: { (heroList) in
            print("List: \(heroList)")
        }, errorBlock: { error in
            print("error: \(error)")
        })
    }
}
