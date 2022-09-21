//
//  FilterViewController.swift
//  PhillipSekuritas
//
//  Created by Renzo Alvaroshan on 20/09/22.
//

import UIKit

private let reuseIdentifer = "FilterCell"

class FilterViewController: UIViewController {
    
    //MARK: - Properties
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let cv = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        cv.register(FilterViewCell.self, forCellWithReuseIdentifier: reuseIdentifer)
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    private lazy var applyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("APPLY", for: .normal)
        button.addTarget(self, action: #selector(applyTapped), for: .touchUpInside)
        return button
    }()
    
    var selectedStocks: [String] = []
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(observeSelectedStock(_:)), name: Notification.Name(rawValue: "selectedFilterStock"), object: nil)
        
        configureUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "selectedFilterStock"), object: nil)
    }
    
    //MARK: - Selectors
    
    @objc func observeSelectedStock(_ notification: NSNotification) {
        guard let selectedStock = notification.userInfo?["selectedStock"] as? String else { return }
        selectedStocks.append(selectedStock)
        collectionView.reloadData()
    }
    
    @objc func applyTapped() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "selectedFilter"), object: nil, userInfo: ["selectedStock": selectedStocks])
        self.dismiss(animated: true)
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 24)
        
        view.addSubview(applyButton)
        applyButton.centerX(inView: view)
        applyButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 8, width: 250, height: 60)
    }
}

extension FilterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedStocks.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath) as! FilterViewCell
        if indexPath.row == selectedStocks.count {
            cell.configureCell(stockName: "Add Filter", color: .blue)
        } else {
            cell.configureCell(stockName: selectedStocks[indexPath.row], color: .black)
        }
        return cell
    }
}

extension FilterViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == selectedStocks.count {
            // TODO: Show filter list all stocks
            self.present(UINavigationController(rootViewController: PickerViewController()), animated: true)
        }
    }
}


