//
//  TableViewScreenView.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 23/08/2022.
//

import UIKit

protocol TableViewScreenViewProtocol: AnyObject {
    func getData()
}

class TableViewScreenView: UIViewController, TableViewScreenViewProtocol {
// MARK: - Properties
    var dataSource = [Character]()
    let semaphore = DispatchSemaphore(value: 0)
    
// MARK: - View
    let tableView = UITableView(frame: .zero, style: .grouped)
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        title = "Heroes List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
//        let queue = Di
       
        getData()
        setupHierarchy()
        setupLayout(with: self.view.frame.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate { (contex) in
            self.setupLayout(with: size)
        }
    }
    
// MARK: - Methods
    func getData() {
        let networkRequest = MarvelNetwork()
        networkRequest.fetchCharacter { data, error in
            if error != nil {
                DispatchQueue.main.async {
                    self.title = "error loading data"
                    print(error!)
                }
            }
            if let data = data {
                self.dataSource = (data.data?.results)!
                print(self.dataSource)
            }
        }
    }
    
    func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout(with size: CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

// MARK: - Extensions -

extension TableViewScreenView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.configured(name: self.dataSource[indexPath.row].name ?? "Empty",
                        id: self.dataSource[indexPath.row].id ?? 0000000)
//                cell.configured(name: "rfof",
//                       id: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.dataSource.count
            return 2
    }
    
}

extension TableViewScreenView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
