//
//  Watchlist View.swift
//  MarketCompanion
//
//  Created by Yuvraj Rahul Patkar on 10/03/2025.
//

import SwiftUI

struct Watchlist_View: View {
    //these are the stock tickers which are to be displayed.
    @State var stocksToDisplay: [String] = ["AAPL", "NVDA"]
    
    @State var showingNewStockPage = false
    @State var stockToAdd: String = ""
    
    var body: some View {
        VStack{
            Button("New Stock") {
                showingNewStockPage.toggle()
                //Haptic feedback
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            }
            .sheet(isPresented: $showingNewStockPage) {
                Section {
                    Button("Back")
                    {
                        showingNewStockPage.toggle()
                        //Haptic feedback
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }
                    Form{
                        TextField("Enter Stock Ticker", text: $stockToAdd)
                        Spacer()
                    }
                    Button("Add Stock") {
                        stocksToDisplay.append(stockToAdd)
                        stockToAdd = ""
                        showingNewStockPage.toggle()
                        //Haptic feedback
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }
                    
                }
            }
            // Navigation aid if no stocks being displayed
            Spacer()
            if (stocksToDisplay.count) == 0 {
                Text("Click button above to add a new stock")
                    .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.gray)
                            .padding(.top, 50)
            }
            
            //Iterates through the array and displays a Stockblock using each ticker.
            List{
                ForEach(stocksToDisplay, id: \.self) { stockSymbol in
                    HStack {
                        Button(action: {
                            addToWatchlist(stockSymbol)
                        
                            
                        })
                        {
                            Image(systemName: "star.fill")
                        }
                        Stock_View(stockSymbol: stockSymbol)}
                    
                }.onDelete(perform: deleteStockFromStocksToDisplay)
            }
            
        }
        .onAppear {
            loadWatchlist()
        }
    }
    func deleteStockFromStocksToDisplay(at offsets: IndexSet) {
        stocksToDisplay.remove(atOffsets: offsets)}
    //
    func addToWatchlist(_ stock: String) {
        var watchlist = UserDefaults.standard.array(forKey: "watchlist") as? [String] ?? []
        if !watchlist.contains(stock) { // Avoid duplicates
            watchlist.append(stock)
            UserDefaults.standard.set(watchlist, forKey: "watchlist") // Save permanently
        }
    }
        
        
    func loadWatchlist() {
            let watchlist = UserDefaults.standard.array(forKey: "watchlist") as? [String] ?? []
            stocksToDisplay.append(contentsOf: watchlist) // Append watchlist stocks on startup
        }
        //
        
    }




