//
//  PickerViewController.swift
//  PhillipSekuritas
//
//  Created by Renzo Alvaroshan on 20/09/22.
//

import UIKit

class PickerViewController: UIViewController {
    
    //MARK: - Properties
    
    private lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    var selectedStock: String?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc func selectFilter() {
        self.dismiss(animated: true)
        
        guard let selectedStock = selectedStock else { return }

        NotificationCenter.default.post(name: Notification.Name(rawValue: "selectedFilterStock"), object: nil, userInfo: ["selectedStock": selectedStock])
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(pickerView)
        pickerView.centerY(inView: view)
        pickerView.anchor(left: view.leftAnchor, right: view.rightAnchor, height: 300)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(selectFilter))
    }
}

extension PickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stockNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stockNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedStock = stockNames[row]
    }
}
