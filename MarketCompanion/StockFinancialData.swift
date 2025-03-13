//
//  StockFinancialData.swift
//  MarketCompanion
//
//  Created by Yuvraj Rahul Patkar on 10/03/2025.
//

import Foundation

struct StockFinancialData: Codable {
     var id: UUID { UUID() }
     let symbol: String
     let name: String
     let price: Double
     let changesPercentage: Double
     let change: Double
     let dayLow: Double
     let dayHigh: Double
     let yearHigh: Double
     let yearLow: Double
     let marketCap: Double
     let priceAvg50: Double
     let priceAvg200: Double
     let exchange: String
     let volume: Int
     let avgVolume: Int
     let open: Double
     let previousClose: Double
     let eps: Double
     let pe: Double
     let earningsAnnouncement: String
     let sharesOutstanding: Int
     let timestamp: Int
 }
