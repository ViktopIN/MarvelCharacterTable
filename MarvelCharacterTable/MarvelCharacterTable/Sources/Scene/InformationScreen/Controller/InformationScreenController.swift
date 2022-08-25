//
//  InformationScreenController.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 24/08/2022.
//
import UIKit

class InformationScreenController: UIViewController {

//MARK: - Properties
    var data: Character!

    private var informationScreenView: InformationScreenView? {
        guard isViewLoaded else { return nil }
        return view as? InformationScreenView
    }

//MARK: - Lifecycle
    override func loadView() {
        view = InformationScreenView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        print(data?.id as Any)
        print(data?.name as Any)
    }

    //MARK: - Private functions
    private func commonInit() {
        informationScreenView?.fillBlankData(data: data)
    }
}

