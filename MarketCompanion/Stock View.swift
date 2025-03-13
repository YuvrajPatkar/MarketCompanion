//
//  Stock View.swift
//  MarketCompanion
//
//  Created by Yuvraj Rahul Patkar on 10/03/2025.
//

import SwiftUI

struct Stock_View: View {
        @StateObject private var api = FinancialDataAPI()
        @State private var isLoading = true
        @State private var errorMessage: String?
        @State private var showingExpandedStockSheetView = false
         
         var stockSymbol: String
    // This is the symbol used in this particular stockblock
         var body: some View {
             VStack {
                 if isLoading {
                     ProgressView("Fetching \(stockSymbol)...")
                         .padding()
                 } else if let stockData = api.stockFinancialData {
                     // this is the code for the stockblock display
                     VStack{
                         HStack {
                             //symbol
                             Text(stockData.symbol)
                                 .font(.system(size: 27, weight: .bold))
                                 .frame(maxWidth: .infinity, alignment: .leading)
                             //price
                             Text(rounded(input: stockData.price))
                                 .font(.system(size: 22, weight: .medium))
                                 .frame(alignment: .trailing)
                             
                         }
                         //perc change
                         Text(String(stockData.changesPercentage))
                             .font(.system(size: 18, weight: .light))
                             .frame(maxWidth: .infinity, alignment: .trailing)
                             .foregroundColor(stockData.changesPercentage > 0 ? .green : .red)
                         // above is a ternary conditional opearator that determines the color of the text
                         
                        
                         
                         Button("📈") {
                             // this acts as a switch to determine if the sheet should be on or off
                             showingExpandedStockSheetView.toggle()
                             //Haptic feedback
                             UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                         }
                         .font(.system(size: 50, weight: .ultraLight))
                         .frame(maxWidth: .infinity, alignment: .leading)
                         .sheet(isPresented: $showingExpandedStockSheetView)
                         {
                          // This is the view file which will contain the chart and more data
                             ExpandedStockSheet_View(stock: stockData)
                         }
                     }
                     .padding()
                     .background(Color(.systemGray6))
                     .cornerRadius(10)
                 } else if let errorMessage = errorMessage {
                     Text("Error: \(errorMessage)")
                         .foregroundColor(.red)
                         .padding()
                 } else {
                     Text("No data available.")
                         .padding()
                 }
             }
             .onAppear {
                 getStockData()
// calls upon the function
             }
         }
// this function is used to invoke my API code
         private func getStockData() {
             isLoading = true
             errorMessage = nil
             
             api.getFinancialData(symbol: stockSymbol) { success in
                 isLoading = false
                 if !success {
                     errorMessage = "Failed to fetch data for \(stockSymbol)."
                 }
             }
         }
     }
     
#Preview {
    Stock_View(stockSymbol: "AAPL")
}
