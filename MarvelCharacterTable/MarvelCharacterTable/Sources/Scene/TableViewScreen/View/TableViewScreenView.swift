//
//  TableViewScreenView.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 23/08/2022.
//

import UIKit

protocol TableViewScreenViewProtocol: AnyObject {
    func getData() -> [Character]
}

class TableViewScreenView: UIViewController, TableViewScreenViewProtocol {
// MARK: - Properties
    let dataSource = [Character]()
    
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
    func getData() -> [Character] {
        return dataSource
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

// MARK: - Extensions -

extension TableViewScreenView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.configured(name: self.dataSource[indexPath.row].name ?? "Empty",
                        id: self.dataSource[indexPath.row].id ?? 0000000)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
}

extension TableViewScreenView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}
