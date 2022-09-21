//
//  StockViewController.swift
//  PhillipSekuritas
//
//  Created by Renzo Alvaroshan on 20/09/22.
//

import UIKit

private let reuseIdentifier = "StockCell"

class StockViewController: UIViewController {
    
    //MARK: - Properties
    
    private let tableView = UITableView()
    
    var timer: Timer?
    var randomInt: Int = 0
    var searchText: String?
    var searchTexts: [String] = []
    
    // private let searchController = UISearchController(searchResultsController: nil)
    
    private var stocks: [Stock] = stockArray {
        didSet { tableView.reloadData() }
    }
    
    private var filteredStocks = [Stock]() {
        didSet { tableView.reloadData() }
    }
    
    private var inSearchMode: Bool = false
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(randomizer), userInfo: nil, repeats: true)
        
        NotificationCenter.default.addObserver(self, selector: #selector(observeFilters), name: Notification.Name(rawValue: "selectedFilter"), object: nil)
        
        configureUI()
        configureTableView()
        // configureSearchController()
    }
    
    //MARK: - Selectors
    
    @objc func observeFilters(_ notification: NSNotification) {
        guard let filterStocks = notification.userInfo?["selectedStock"] as? [String] else { return }
        
        filterStocks.forEach {
            self.searchTexts.append($0)
        }
        
        for i in 0..<stocks.count {
            for j in 0..<searchTexts.count {
                if stocks[i].name.contains(searchTexts[j])  {
                    filteredStocks.append(stocks[i])
                }
            }
        }
        
        inSearchMode = true
        
        filteredStocks.sort(by: { $0.name < $1.name })
        
        tableView.reloadData()
    }
    
    @objc func randomizer() {
        randomInt = Int.random(in: 0..<7)
        
        let newStock = Stock(name: stockNames[randomInt], price: stockPrices[randomInt], change: stockChanges[randomInt], volume: stockVolumes[randomInt], date: StockTableViewCell().dateFormatter())
        
        stocks.insert(newStock, at: 0)
        
        searchTexts.map {
            if newStock.name == $0 {
                filteredStocks.insert(newStock, at: 0)
            }
        }
        
//        guard newStock.name == searchText else { return }
//
//        filteredStocks.insert(newStock, at: 0)
    }
    
    //MARK: - Selectors
    
    @objc func addFilter() {
        self.present(FilterViewController(), animated: true)
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Running Trade"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFilter))
    }
    
    private func configureTableView() {
        tableView.register(StockTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 40
        
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
    }
    
    /*private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a user"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }*/
}

extension StockViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ? filteredStocks.count : stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! StockTableViewCell
        let stock = inSearchMode ? filteredStocks[indexPath.row] : stocks[indexPath.row]
        cell.stock = stock
        return cell
    }
}

extension StockViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderViewCell()
        return header
    }
}

/*extension StockViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.uppercased() else { return }
        self.searchText = searchText
        
        filteredStocks = stocks.filter({ $0.name.contains(searchText) })
    }
}*/

