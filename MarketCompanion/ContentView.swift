//
//  ContentView.swift
//  MarketCompanion
//
//  Created by Yuvraj Rahul Patkar on 10/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
                    TabView {
                        News_View()
                            .tabItem {
                                Label("News", systemImage: "rectangle.3.group.bubble")
                            }
                        
                        Watchlist_View()
                            .tabItem {
                                Label("Watchlist", systemImage: "chart.bar")
                            }
                        Chatbot_View()
                            .tabItem {
                                Label("Chatbot", systemImage: "network")
                            }
                    }
                }
        .padding()
    }
}

#Preview {
    ContentView()
}
