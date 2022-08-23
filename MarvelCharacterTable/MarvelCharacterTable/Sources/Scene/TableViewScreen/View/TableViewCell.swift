//
//  TableViewCell.swift
//  MarvelCharacterTable
//
//  Created by Виктор on 23/08/2022.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
// MARK: - Properties
    static let identifier = "TableViewCell"
    
// MARK: - Views
    let nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
// MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        contentView.addSubview(nameLabel)
        contentView.addSubview(idLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Methods
    func configured(name: String, id: Int) {
        self.nameLabel.text = name
        self.idLabel.text = String(id)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(Metrics.comicTitleLabelFontSize)
            make.left.equalTo(contentView.snp.left).offset(Metrics.comicTitleLabelLeftOffset)
            make.right.equalTo(contentView.snp.right).offset(Metrics.comicTitleLabelRightOffset)
        }

        idLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(Metrics.comicIdLabelBottomOffset)
            make.left.equalTo(nameLabel.snp.left)
        }
    }
}

//MARK: - Metrics
extension TableViewCell {
    enum Metrics {
        static let comicTitleLabelFontSize: CGFloat = 14
        static let comicIdLabelFontSize: CGFloat = 12

        static let comicTitleLabelTopOffset = 15
        static let comicTitleLabelLeftOffset = 17
        static let comicTitleLabelRightOffset = -17

        static let comicIdLabelBottomOffset = -10
    }
}
