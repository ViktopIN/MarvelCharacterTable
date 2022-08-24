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
        
        label.font = UIFont(name: "Courier New", size: Metrics.idLabelFontSize)
        label.textColor = UIColor.gray
        
        return label
    }()
    
// MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(idLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Methods
    func configured(name: String, id: Int) {
        if name.count >= 27 {
            self.nameLabel.text = "\(String(name.dropLast(name.count - 27))).."
        } else {
            self.nameLabel.text = name
        }
        self.idLabel.text = "id: \(String(id))"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(Metrics.titleLabelFontSize)
            make.left.equalTo(contentView.snp.left).offset(Metrics.titleLabelLeftOffset)
            make.right.equalTo(contentView.snp.right).offset(Metrics.titleLabelRightOffset)
        }

        idLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(Metrics.idLabelBottomOffset)
            make.left.equalTo(nameLabel.snp.right).offset(Metrics.idLabelLeftOffset)
        }
    }
}

//MARK: - Metrics
extension TableViewCell {
    enum Metrics {
        static let titleLabelFontSize: CGFloat = 14
        static let idLabelFontSize: CGFloat = 12

        static let titleLabelLeftOffset = 17
        static let titleLabelRightOffset = -17

        static let idLabelBottomOffset = -10
        static let idLabelLeftOffset = -95
    }
}
