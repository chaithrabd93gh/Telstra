//
//  Country.swift
//  MyApp
//
//  Created by Chaithra on 11/02/20.
//  Copyright © 2020 chaithra. All rights reserved.
//

import UIKit

struct Countries: Codable {
    var title: String?
    var rows: [Country]?
}

struct Country: Codable {

    var title: String?
    var description: String?
    var imageHref: String?
}
