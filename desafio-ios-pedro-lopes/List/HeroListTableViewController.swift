//
//  HeroListTableViewController.swift
//  desafio-ios-pedro-lopes
//
//  Created by Pedro Lopes on 09/03/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//

import Foundation
import UIKit

class HeroListTableViewController: UITableViewController {
    
    var heroListInteractor: HeroListInteractorProtocol?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.heroListInteractor = HeroListInteractor()
        self.heroListInteractor?.fetchHeroList()
    }
}
