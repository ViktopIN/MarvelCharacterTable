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
        
    }
    
// MARK: - Methods
    func receivingData() {
    
    }
    
    private func setupLayout(with size: CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
    }
    
    private func setupTableView() {
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
}
