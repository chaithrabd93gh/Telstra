//
//  ViewController.swift
//  MyApp
//
//  Created by chaithra on 11/02/20.
//  Copyright © 2020 chaithra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy private var tableView = UITableView()
    lazy private var activityIndicator = UIActivityIndicatorView()
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadData()
    }
    
    func setUI() {
        setTableview()
    }
    
    func setTableview() {
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    
    func loadData() {
        viewModel.loadData()
        viewModel.didUpdate = {
            self.didUpdate()
        }
    }
    
    func didUpdate() {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.title = self.viewModel.countries?.title
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countries?.rows?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

