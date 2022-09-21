//
//  StockTableViewCell.swift
//  PhillipSekuritas
//
//  Created by Renzo Alvaroshan on 20/09/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    var stock: Stock? {
        didSet { configure() }
    }
    
    private lazy var stockLabel: UILabel = { standardLabel(text: nil) }()
    
    private lazy var priceLabel: UILabel = { standardLabel(text: nil) }()
    
    private lazy var changeLabel: UILabel = { standardLabel(text: nil) }()
    
    private lazy var volumeLabel: UILabel = { standardLabel(text: nil) }()
    
    private lazy var actLabel: UILabel = { standardLabel(text: "KK") }()
    
    private lazy var timeLabel: UILabel = { standardLabel(text: nil) }()
    
//    private lazy var leftStack: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [stockLabel, priceLabel, changeLabel])
//        stack.axis = .horizontal
//        stack.spacing = 12
//        return stack
//    }()
    
//    private lazy var rightStack: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [volumeLabel, actLabel, timeLabel])
//        stack.axis = .horizontal
//        stack.spacing = 12
//        return stack
//    }()
    
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configure() {
        guard let stock = stock else { return }
        
        stockLabel.text = stock.name
        priceLabel.text = stock.price
        changeLabel.text = stock.change
        volumeLabel.text = stock.volume
        timeLabel.text = stock.date
        
        var color: UIColor
        
        changeLabel.text?.first == "+" ? (color = .systemGreen) : (color = .systemRed)
        
        stockLabel.textColor = color
        priceLabel.textColor = color
        changeLabel.textColor = color
        volumeLabel.textColor = color
    }
    
    func configureCell() {
        
//        addSubview(leftStack)
//        leftStack.centerY(inView: self)
//        leftStack.anchor(top: topAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 12)
        
        addSubview(stockLabel)
        stockLabel.centerY(inView: self)
        stockLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 4, paddingLeft: 12, width: 70)
        
        addSubview(priceLabel)
        priceLabel.centerY(inView: self)
        priceLabel.anchor(top: topAnchor, left: stockLabel.rightAnchor, paddingTop: 4, paddingLeft: 4, width: 70)
        
        addSubview(changeLabel)
        changeLabel.centerY(inView: self)
        changeLabel.anchor(top: topAnchor, left: priceLabel.rightAnchor, paddingTop: 4, paddingLeft: 4, width: 60)
        
//        addSubview(rightStack)
//        rightStack.centerY(inView: self)
//        rightStack.anchor(top: topAnchor, left: changeLabel.rightAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 4, paddingRight: 12)
        
        addSubview(volumeLabel)
        volumeLabel.centerY(inView: self)
        volumeLabel.anchor(top: topAnchor, left: changeLabel.rightAnchor, paddingTop: 4, paddingLeft: 4, width: 50)
        
        addSubview(actLabel)
        actLabel.centerY(inView: self)
        actLabel.anchor(top: topAnchor, left: volumeLabel.rightAnchor, paddingTop: 4, paddingLeft: 4, width: 30)
        
        addSubview(timeLabel)
        timeLabel.centerY(inView: self)
        timeLabel.anchor(top: topAnchor, left: actLabel.rightAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 4, paddingRight: 12, width: 100)
    }
    
    func dateFormatter() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        
        return formatter.string(from: Date())
    }
    
    private func standardLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = text
        label.textColor = .black
        return label
    }
}
