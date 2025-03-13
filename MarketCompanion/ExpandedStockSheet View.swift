//
//  ExpandedStockSheet View.swift
//  MarketCompanion
//
//  Created by Yuvraj Rahul Patkar on 10/03/2025.
//

import SwiftUI

struct ExpandedStockSheet_View: View {
    var stock: StockFinancialData

    struct Row: Identifiable {
        let id = UUID()
        let metric: String
        let dataPoint: String
    }

    @State private var tableData: [Row] = []

    var body: some View {
        VStack {
            Text(stock.name)

            Table(tableData) {
                TableColumn("Metric") { row in
                    Text(row.metric)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                TableColumn("Value") { row in
                    Text(row.dataPoint)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
            }
        }
        .onAppear {
            loadTableData()
        }
    }

    private func loadTableData() {
        tableData = [
            Row(metric: "Stock Name", dataPoint: stock.name),
            Row(metric: "Current Price", dataPoint: formatNumber(stock.price)),
            Row(metric: "Percentage Change", dataPoint: formatNumber(stock.changesPercentage) + "%"),
            Row(metric: "Points Change", dataPoint: formatNumber(stock.change)),
            Row(metric: "Market Cap", dataPoint: formatLargeNumber(stock.marketCap)),
            Row(metric: "Volume", dataPoint: formatLargeNumber(Double(stock.volume))),
            Row(metric: "Day Low", dataPoint: formatNumber(stock.dayLow)),
            Row(metric: "Day High", dataPoint: formatNumber(stock.dayHigh)),
            Row(metric: "Year Low", dataPoint: formatNumber(stock.yearLow)),
            Row(metric: "Year High", dataPoint: formatNumber(stock.yearHigh)),
            Row(metric: "EPS", dataPoint: formatNumber(stock.eps)),
            Row(metric: "P/E Ratio", dataPoint: formatNumber(stock.pe)),
            Row(metric: "Open", dataPoint: formatNumber(stock.open)),
            Row(metric: "Previous Close", dataPoint: formatNumber(stock.previousClose))
        ]
    }

    private func formatNumber(_ number: Double) -> String {
        return String(format: "%.2f", number) // Ensures all numbers display with 2 decimal places
    }

    private func formatLargeNumber(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
}
