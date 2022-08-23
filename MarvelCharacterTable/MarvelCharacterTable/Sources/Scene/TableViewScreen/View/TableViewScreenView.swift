//
//  TableViewScreenView.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 23/08/2022.
//

import UIKit

protocol TableViewScreenViewProtocol: class {
    func receivingData()
}

class TableViewScreenView: UIViewController, TableViewScreenViewProtocol {
// MARK: - View
    let tableView = UITableView(frame: .zero, style: .grouped)
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        title = "Heroes List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupHierarchy()
        setupLayout(with: self.view.frame.size)
        setupTableView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate { (contex) in
            self.setupLayout(with: size)
        }
    }
// MARK: - Methods
    func receivingData() {
    
    }
    
    func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout(with size: CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
    }
    
    private func setupTableView() {
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
}

extension TableViewScreenView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
}

extension TableViewScreenView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}
