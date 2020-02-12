//
//  DataManager.swift
//  MyApp
//
//  Created by Chaithra on 11/02/20.
//  Copyright © 2020 chaithra. All rights reserved.
//

import UIKit

let url = "https://api.myjson.com/bins/ao19k"

let session = URLSession.shared

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func getData(completion: @escaping (Countries)->()) {
        let request = URLRequest(url: URL(string: url)!)
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                if let data = data {
                    var jsonData = try JSONDecoder().decode(Countries.self, from: data)
                    jsonData.rows = jsonData.rows?.filter({$0.title != nil })
                    completion(jsonData)
                }
            } catch {
                print("error")
            }
        })
        
        task.resume()
    }
}
