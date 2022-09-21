//
//  FilterViewCell.swift
//  PhillipSekuritas
//
//  Created by Renzo Alvaroshan on 20/09/22.
//

import UIKit

class FilterViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        contentView.addSubview(titleLabel)
        titleLabel.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 12, paddingRight: 12)
    }
    
    func configureCell(stockName: String, color: UIColor) {
        self.titleLabel.text = stockName
        self.titleLabel.textColor = color
    }
}
