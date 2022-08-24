//
//  TableVIewScreenPresenter.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 23/08/2022.
//

import UIKit

protocol TableViewScreenPresenterProtocol: AnyObject {
    init (view: TableViewScreenViewProtocol)
}

class TableViewScreenPresenter: TableViewScreenPresenterProtocol {
// MARK: - Properties
    var view: TableViewScreenViewProtocol!
    
// MARK: - Initialize
    required init(view: TableViewScreenViewProtocol) {
        self.view = view
    }
}
