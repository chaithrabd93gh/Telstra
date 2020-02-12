//
//  ViewModel.swift
//  MyApp
//
//  Created by Chaithra on 11/02/20.
//  Copyright © 2020 chaithra. All rights reserved.
//

import UIKit

class ViewModel {
    var countries: Countries? {
        didSet {
            self.didUpdate?()
        }
    }
    
    var error: String?
    // MARK: - Closures for callback
    var didUpdate:(() -> Void)?
    
    //MARK: - Table related methods
    func numberOfRows(in section: Int) -> Int {
        return countries?.rows?.count ?? 0
    }
    
    func cellData(for indexPath: IndexPath) -> Country {
        return countries?.rows?[indexPath.row] ?? Country()
    }
}

extension ViewModel {
    func loadData() {
        DataManager.shared.getData { (countires,error)  in
            if let countris = countires {
                self.countries = countris
            } else if let err = error {
                self.error = err
            }
        }
    }
}
