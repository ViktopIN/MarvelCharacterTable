//
//  InformationScreenView.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 24/08/2022.
//

import UIKit

class InformationScreenView: UIScrollView {
// MARK: - Views
    private lazy var parentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "system", size: Metrics.nameFontSize)
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var storiesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
// MARK: - Initial
    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
        setupView()
    }
// MARK: - Settings
    private func setupHierarchy() {
        let parentViewSubviews = [
            image,
            idLabel,
            nameLabel,
            descriptionLabel,
            storiesLabel
        ]

        addSubview(parentView)
        parentViewSubviews.forEach { parentView.addSubview($0) }
    }

    private func setupLayout() {
        parentView.snp.makeConstraints { make in
            make.edges.equalTo(self.snp.edges)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height).offset(Metrics.parentViewHeightOffset)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(parentView.safeAreaLayoutGuide.snp.top).offset(Metrics.primaryTopOffset)
            make.left.equalTo(parentView.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
            make.right.equalTo(parentView.safeAreaLayoutGuide.snp.right).offset(Metrics.primaryRightOffset)
        }

        image.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.centerX.equalTo(parentView.snp.centerX)
            make.height.equalTo(400)
            make.width.equalTo(300)
        }

        idLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(parentView.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
            make.right.equalTo(parentView.safeAreaLayoutGuide.snp.right).offset(Metrics.primaryRightOffset)
        }

        storiesLabel.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(parentView.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
            make.right.equalTo(parentView.safeAreaLayoutGuide.snp.right).offset(Metrics.primaryRightOffset)
        }
    }

    private func setupView() {
        backgroundColor = .systemBackground
    }
    
// MARK: - Methods
    func fillBlankData(data: Character) {
        self.nameLabel.text = data.name
        
        let id = data.id ?? 0
        
        self.idLabel.text = String(id)
        
        self.descriptionLabel.text = data.descriptioin
        
        self.storiesLabel.numberOfLines = data.stories?.returned ?? 0
        
        var storiesFinal = [String()]
        if let stories = data.stories?.items {
            for story in stories {
                storiesFinal.append(story.name ?? "")
            }
        }
        self.storiesLabel.text = storiesFinal.joined(separator: ",\n")
    }
}

//MARK: - Metrics
extension InformationScreenView {
    enum Metrics {
        static let nameLabelFontSize: CGFloat = 22
        static let nameFontSize: CGFloat = 14

        static let parentViewHeightOffset = 500

        static let primaryTopOffset = 15
        static let primaryLeftOffset = 15
        static let primaryRightOffset = -20
    }
}

