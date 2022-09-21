//
//  HeaderViewCell.swift
//  PhillipSekuritas
//
//  Created by Renzo Alvaroshan on 20/09/22.
//

import UIKit

class HeaderViewCell: UIView {
    
    //MARK: - Properties
    
    private lazy var stockTitle: UILabel = { standardLabel(text: "STOCK") }()
    
    private lazy var priceTitle: UILabel = { standardLabel(text: "PRICE") }()
    
    private lazy var changeTitle: UILabel = { standardLabel(text: "CHG") }()
    
    private lazy var volumeTitle: UILabel = { standardLabel(text: "VOL") }()
    
    private lazy var actTitle: UILabel = { standardLabel(text: "ACT") }()
    
    private lazy var timeTitle: UILabel = { standardLabel(text: "TIME") }()
    
//    private lazy var leftStack: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [stockTitle, priceTitle, changeTitle])
//        stack.axis = .horizontal
//        stack.spacing = 12
//        return stack
//    }()
    
//    private lazy var rightStack: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [volumeTitle, actTitle, timeTitle])
//        stack.axis = .horizontal
//        stack.spacing = 12
//        return stack
//    }()
    
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
//        addSubview(leftStack)
//        leftStack.centerY(inView: self)
//        leftStack.anchor(top: topAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 12)
        
        addSubview(stockTitle)
        stockTitle.centerY(inView: self)
        stockTitle.anchor(top: topAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 12, width: 70)
        
        addSubview(priceTitle)
        priceTitle.centerY(inView: self)
        priceTitle.anchor(top: topAnchor, left: stockTitle.rightAnchor, paddingTop: 4, paddingLeft: 4, width: 70)
        
        addSubview(changeTitle)
        changeTitle.centerY(inView: self)
        changeTitle.anchor(top: topAnchor, left: priceTitle.rightAnchor, paddingTop: 4, paddingLeft: 4, width: 60)
        
//        addSubview(rightStack)
//        rightStack.centerY(inView: self)
//        rightStack.anchor(top: topAnchor, left: changeTitle.rightAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 4, paddingRight: 12)
        
        addSubview(volumeTitle)
        volumeTitle.centerY(inView: self)
        volumeTitle.anchor(top: topAnchor, left: changeTitle.rightAnchor, paddingTop: 4, paddingLeft: 4, width: 50)
        
        addSubview(actTitle)
        actTitle.centerY(inView: self)
        actTitle.anchor(top: topAnchor, left: volumeTitle.rightAnchor, paddingTop: 4, paddingLeft: 4, width: 30)
        
        addSubview(timeTitle)
        timeTitle.centerY(inView: self)
        timeTitle.anchor(top: topAnchor, left: actTitle.rightAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 16, paddingRight: 12, width: 100)
    }
    
    private func standardLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = text
        label.textColor = .black
        return label
    }
}
