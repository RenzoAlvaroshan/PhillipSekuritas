//
//  Stock.swift
//  PhillipSekuritas
//
//  Created by Renzo Alvaroshan on 20/09/22.
//

import Foundation

struct Stock {
    let name: String
    let price: String
    let change: String
    let volume: String
    let date: String?
}

var stockArray: [Stock] = [
    Stock(name: "ANTM", price: "2030", change: "+3.2%", volume: "50", date: StockTableViewCell().dateFormatter()),
    Stock(name: "GOTO", price: "280", change: "+8.2%", volume: "600", date: StockTableViewCell().dateFormatter()),
    Stock(name: "BBCA", price: "7850", change: "+3.2%", volume: "15", date: StockTableViewCell().dateFormatter()),
    Stock(name: "MDKA", price: "4000", change: "-4.33%", volume: "70", date: StockTableViewCell().dateFormatter()),
    Stock(name: "MPMX", price: "980", change: "+5.2%", volume: "100", date: StockTableViewCell().dateFormatter()),
    Stock(name: "BUKA", price: "305", change: "-1.2%", volume: "800", date: StockTableViewCell().dateFormatter()),
    Stock(name: "INKP", price: "9200", change: "+2.2%", volume: "10", date: StockTableViewCell().dateFormatter()),
]

let stockNames: [String] = ["ANTM", "GOTO", "BBCA", "MDKA", "MPMX", "BUKA", "INKP"]
let stockPrices: [String] = ["2030", "280", "7850", "4000", "980", "305", "9200"]
let stockChanges: [String] = ["+3.2%", "+8.2%", "+3.2%", "-4.33%", "+5.2%", "-1.2%", "+2.2%"]
let stockVolumes: [String] = ["50", "600", "15", "70", "100", "800", "10"]
