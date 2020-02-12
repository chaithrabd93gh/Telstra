//
//  ViewController.swift
//  MyApp
//
//  Created by chaithra on 11/02/20.
//  Copyright © 2020 chaithra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let reuseIdentifier = "reuseId"
    lazy private var tableView = UITableView()
    lazy private var activityIndicator = UIActivityIndicatorView()
    lazy private var refreshControl = UIRefreshControl()
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUI()
        loadData()
    }
    
    // MARK:- Set up UI
    func setUI() {
        view.backgroundColor = .white
        setTableview()
        setRefreshControl()
    }
    
    func setTableview() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.addSubview(refreshControl)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func setRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString.init(string: "Refreshing")
        refreshControl.addTarget(self, action:
            #selector(ViewController.refresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.gray
    }
    
    func loadData() {
        viewModel.loadData()
        viewModel.didUpdate = {[weak self] in
            guard let self = self else { return }
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
    
    //MARK: - IBAction
   @objc func refresh(_ refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
        loadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier) as? TableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setCountryData(viewModel.cellData(for: indexPath))
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? TableViewCell {
            let data = viewModel.cellData(for: indexPath)
            cell.setImage(with: data.imageHref)
        }
    }
}

