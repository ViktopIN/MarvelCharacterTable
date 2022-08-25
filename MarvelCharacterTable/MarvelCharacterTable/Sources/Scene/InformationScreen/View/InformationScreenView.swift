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
        label.font = UIFont(name: "Courier New", size: Metrics.idFontSize)
        
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: Metrics.nameFontSize)
        
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
        backgroundColor = .systemBackground
        parentView.snp.makeConstraints { make in
            make.edges.equalTo(self.snp.edges)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height).offset(Metrics.parentViewHeightOffset)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(parentView.safeAreaLayoutGuide.snp.top).inset(Metrics.nameLabelTopInset)
            make.left.equalTo(parentView.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
            make.right.equalTo(parentView.safeAreaLayoutGuide.snp.right).offset(Metrics.primaryRightOffset)
        }

        image.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.centerX.equalTo(parentView.snp.centerX)
            make.height.equalTo(400)
            make.width.equalTo(300)
        }
//
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.top).inset(10)
            make.right.equalTo(nameLabel.snp.right)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(Metrics.descriptionTopOffset)
            make.left.equalTo(parentView.snp.left).inset(Metrics.descriptionSidesInset)
            make.right.equalTo(parentView.snp.right).inset(Metrics.descriptionSidesInset)
        }

        storiesLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(parentView.snp.left).inset(Metrics.descriptionSidesInset)
            make.right.equalTo(parentView.snp.right).inset(Metrics.descriptionSidesInset)
        }
    }
    
// MARK: - Methods
    func fillBlankData(data: Character) {
        if let data = data.name {
            if data.count <= 32 {
                self.nameLabel.text = data
            } else {
                self.nameLabel.font = UIFont.systemFont(ofSize: Metrics.longNameFontSize)
                self.nameLabel.text = data
            }
        }
        
        let id = data.id ?? 0
        
        self.idLabel.text = "id: \(String(id))"
        
        if data.description == "" {
            self.descriptionLabel.text = "Description:\n-"
        } else if let data = data.description {
            self.descriptionLabel.text = "Description:\n\(data)"
            print(data)
        }
        
        self.storiesLabel.numberOfLines = data.stories?.returned ?? 0
        
        var storiesFinal = ["Stories:"]
        if data.stories?.returned == 0 {
            storiesFinal.append("-")
        } else if let stories = data.stories?.items {
            for (num, story) in stories.enumerated() {
                storiesFinal.append("\(num + 1). \(story.name ?? "")")
            }
        }
        self.storiesLabel.text = storiesFinal.joined(separator: "\n")
        
        let queue = DispatchQueue(label: "myQueue", qos: .userInteractive)
        queue.async {
            guard let imagePath = data.getThumbnailUrl(),
                  let imageURL = URL(string: imagePath),
                  let imageData = try? Data(contentsOf: imageURL)
            else { return }

            DispatchQueue.main.async {
                self.image.image = UIImage(data: imageData)
            }
        }
    }
}

//MARK: - Metrics
extension InformationScreenView {
    enum Metrics {
        static let nameFontSize: CGFloat = 18
        static let longNameFontSize: CGFloat = 16
        static let idFontSize: CGFloat = 10

        static let parentViewHeightOffset = 500
        
        static let nameLabelTopInset = -18
        
        static let descriptionTopOffset = 30
        static let descriptionSidesInset = 45
        
        static let primaryTopOffset = 30
        static let primaryLeftOffset = 15
        static let primaryRightOffset = -20
    }
}

