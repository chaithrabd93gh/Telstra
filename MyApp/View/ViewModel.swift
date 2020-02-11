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
    
    // MARK: - Closures for callback
    var didUpdate:(() -> Void)?
}

extension ViewModel {
    func loadData() {
        DataManager.shared.getData { (countires) in
            self.countries = countires
        }    }
}
